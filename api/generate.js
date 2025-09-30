import knowledgeBase from "../src/components/Chatbot/knowledgeBase.js";
console.log("KnowledgeBase loaded:", knowledgeBase?.context?.slice(0, 50));
// Helper: decide which KB snippet to include based on user input
function getRelevantKBSnippet(userMessage) {
  const msg = userMessage.toLowerCase();
  const snippets = [];

  if (msg.includes("payment") || msg.includes("pay")) snippets.push(knowledgeBase.examples.payment);
  if (msg.includes("delivery") || msg.includes("ship") || msg.includes("order")) snippets.push(knowledgeBase.examples.delivery);
  if (msg.includes("return") || msg.includes("refund")) snippets.push(knowledgeBase.examples.returns);
  if (msg.includes("support") || msg.includes("help") || msg.includes("contact")) snippets.push(knowledgeBase.examples.support);
  if (msg.includes("who made") || msg.includes("creator") || msg.includes("built") || msg.includes("author")) snippets.push(knowledgeBase.examples.creator);
  if (msg.includes("technology") || msg.includes("tech") || msg.includes("framework") || msg.includes("tool")) snippets.push(knowledgeBase.examples.tech);
  if (msg.includes("products") || msg.includes("items") || msg.includes("sell") || msg.includes("groceries") || msg.includes("offer")) snippets.push(knowledgeBase.examples.products);

  if (snippets.length === 0) snippets.push(knowledgeBase.context);

  return snippets.join("\n\n");
}

export default async function handler(req, res) {
  try {
    if (req.method !== "POST") {
      return res.status(405).json({ text: "Method not allowed" });
    }

    const { userInput } = req.body;
    if (!userInput || userInput.trim().length === 0) {
      return res.status(400).json({ text: "Missing user input" });
    }

    // Key rotation
    const GEMINI_API_KEYS = [
      process.env.GEMINI_API_KEY_1,
      process.env.GEMINI_API_KEY_2,
      process.env.GEMINI_API_KEY_3,
    ].filter(Boolean);

    if (GEMINI_API_KEYS.length === 0) {
      throw new Error("No API keys configured");
    }

    // Build system prompt securely on backend
    const systemPrompt = `
SYSTEM INSTRUCTIONS:
You are Grocify's virtual assistant.  
Always interpret "website", "project", "platform", "site", or "bot" as Grocify.  
Use the knowledge base below for products, delivery, payment, support, company info, and technologies.  
Be polite, clear, and professional when answering business questions.  
If the user goes off-topic, personal, or casual, respond naturally and with light humor.

RULES:
${knowledgeBase.rules}

DOCUMENT CONTEXT:
${getRelevantKBSnippet(userInput)}
`;

    let lastError = null;

    // Try each API key in order
    for (const key of GEMINI_API_KEYS) {
      try {
        const response = await fetch(
          `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${key}`,
          {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
              contents: [
                {
                  role: "user",
                  parts: [{ text: `${systemPrompt}\nUser Question: ${userInput}` }]
                }
              ]
            }),
          }
        );

        const data = await response.json();

        if (data?.error) {
          lastError = data.error;
          // Continue to next key if rate limited or bad request
          if (data.error.code === 429 || data.error.code === 400) continue;
          throw new Error(JSON.stringify(data.error));
        }

        return res.status(200).json({
          text: data?.candidates?.[0]?.content?.parts?.[0]?.text ||
            "I don't have specific information about that. I can respond only about our grocery website.",
        });

      } catch (err) {
        lastError = err;
        continue;
      }
    }

    // All keys failed
    console.error("All Gemini keys failed:", lastError);
    return res.status(500).json({
      text: "⚠️ Too many requests or server error. Please try again in a few seconds.",
    });

  } catch (err) {
    console.error("Backend error:", err);
    return res.status(500).json({ text: "⚠️ Something went wrong on the server." });
  }
}
