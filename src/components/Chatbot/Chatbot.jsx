import React, { useState, useRef, useEffect } from "react";
import localQA from "../Chatbot/localQA.js"; // Local Q&A


// Match local QA with regex
function findLocalAnswer(userMessage) {
  const message = userMessage.toLowerCase();

  for (const item of localQA) {
    for (const q of item.question) {
      const regex = new RegExp(`\\b${q.toLowerCase()}\\b`, "i");
      if (regex.test(message)) {
        return item.answer;
      }
    }
  }
  return null;
}

// Decide if we should call Gemini
function shouldUseGemini(message) {
  if (!message || message.trim().length < 3) return false;

  // Reject gibberish (no spaces or no letters)
  const alphaNum = message.replace(/[^a-z0-9\s]/gi, "");
  const words = alphaNum.trim().split(/\s+/);
  if (words.length < 2) return false;

  return true;
}

const Chatbot = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([]);
  const [inputMessage, setInputMessage] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const messagesEndRef = useRef(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);


 // Call backend /api/generate
  const generateResponse = async (userInput) => {
    try {
      const res = await fetch("/api/generate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userInput }), // ✅ only sending userInput
      });

      const data = await res.json();
      return data.text;
    } catch (error) {
      console.error("Frontend error:", error);
      return "⚠️ Something went wrong. Please try again later.";
    }
  };


  const handleSendMessage = async () => {
    if (!inputMessage.trim()) return; // ignore empty input

  const userMessage = { text: inputMessage, sender: "user" };
  setMessages((prev) => [...prev, userMessage]);
  setInputMessage("");
  setIsLoading(true);

  let botReply = "";

  // 1️⃣ Check Local QA first (save API calls)
  const localAnswer = findLocalAnswer(userMessage.text);
  if (localAnswer) {
     // Add a small delay to simulate typing
      await new Promise((resolve) =>
        setTimeout(resolve, 800 + Math.random() * 1200)
      );
    botReply = localAnswer;
  } 
  // 2️⃣ Fallback to Gemini if input is valid
  else if (shouldUseGemini(userMessage.text)) {
    try {
      botReply = await generateResponse(userMessage.text);

      // fallback if API fails or returns unexpected data
      if (!botReply || botReply.toLowerCase().includes("error")) {
        botReply =
          "I don't have specific information about that. I can respond only about our grocery website.";
      }
    } catch (err) {
      console.error("Gemini API error:", err);
      botReply =
        "I don't have specific information about that. I can respond only about our grocery website.";
    }
  } 
  // 3️⃣ If input is invalid or gibberish
  else {
    botReply =
      "I don't have specific information about that. I can respond only about our grocery website.";
  }

  setIsLoading(false);
  setMessages((prev) => [...prev, { text: botReply, sender: "bot" }]);
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter") handleSendMessage();
  };

  const handleOpenChat = () => {
    setIsOpen(true);
    if (messages.length === 0) {
      setIsLoading(true);
      setTimeout(() => {
        setIsLoading(false);
        setMessages([
          {
            text: "Hello! I'm Grocify's virtual assistant. How can I help you today?",
            sender: "bot",
          },
        ]);
      }, 1000);
    }
  };

  return (
    <div className="fixed bottom-6 right-6 z-50 font-sans">
      {!isOpen && (
        <button
          onClick={handleOpenChat}
          className="bg-green-600 hover:bg-green-700 text-white rounded-full p-4 shadow-lg transition-all duration-300 hover:scale-110 flex items-center justify-center"
          aria-label="Open chat"
        >
          <svg
            className="w-6 h-6"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"
            ></path>
          </svg>
        </button>
      )}

      {isOpen && (
        <div className="bg-white rounded-lg shadow-xl border border-gray-200 w-80 h-96 flex flex-col">
          {/* Header */}
          <div className="bg-green-600 text-white p-3 rounded-t-lg flex justify-between items-center">
            <div className="flex items-center space-x-2">
              <div className="w-3 h-3 bg-green-300 rounded-full animate-pulse"></div>
              <h3 className="font-semibold">Grocify Support</h3>
            </div>
            <button
              onClick={() => setIsOpen(false)}
              className="text-white hover:text-gray-200 transition-colors"
            >
              <svg
                className="w-5 h-5"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M19 9l-7 7-7-7"
                ></path>
              </svg>
            </button>
          </div>

          {/* Messages */}
          <div className="flex-1 overflow-y-auto p-4 space-y-3 bg-gray-50">
            {messages.map((message, index) => (
              <div
                key={index}
                className={`flex ${
                  message.sender === "user" ? "justify-end" : "justify-start"
                }`}
              >
                <div
                  className={`max-w-xs px-4 py-2 rounded-lg ${
                    message.sender === "user"
                      ? "bg-green-600 text-white rounded-br-none"
                      : "bg-white text-gray-800 border border-gray-200 rounded-bl-none"
                  }`}
                >
                  {message.text}
                </div>
              </div>
            ))}

            {isLoading && (
              <div className="flex justify-start">
                <div className="max-w-xs px-4 py-2 rounded-lg bg-white text-gray-800 border border-gray-200 rounded-bl-none flex items-center space-x-2">
                  <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
                  <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse delay-150"></div>
                  <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse delay-300"></div>
                  <span>typing...</span>
                </div>
              </div>
            )}

            <div ref={messagesEndRef} />
          </div>

          {/* Input */}
          <div className="p-3 border-t border-gray-200 bg-white">
            <div className="flex space-x-2">
              <input
                type="text"
                value={inputMessage}
                onChange={(e) => setInputMessage(e.target.value)}
                onKeyPress={handleKeyPress}
                placeholder="Type your message..."
                className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500"
              />
              <button
                onClick={handleSendMessage}
                disabled={!inputMessage.trim()}
                className="bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white px-4 py-2 rounded-lg transition-colors"
              >
                <svg
                  className="w-5 h-5"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M13 5l7 7-7 7M5 5l7 7-7 7"
                  ></path>
                </svg>
              </button>
            </div>
            <p className="text-xs text-gray-500 mt-2 text-center">
              Our support team is available 24/7 at support@grocify.com
            </p>
          </div>
        </div>
      )}
    </div>
  );
};

export default Chatbot;
