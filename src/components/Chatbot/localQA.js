const localQA = [
  {
    question: [
      "hi", "hello", "hey", "hi there", "hii", "hiii", "helo", "heloo", "helloo", "yo", "wassup"
    ],
    answer: "Hello 👋 Welcome to Grocify! How can I help you today?",
  },
  {
    question: [
      "how are you", "how are you doing", "how r u", "how r you", "hw are you", "hru", "whats up", "what's up"
    ],
    answer: "I'm doing great! Thanks for asking 😊 How can I assist you with Grocify?",
  },
  {
    question: [
      "what is grocify", "tell me about grocify", "what do you do","what you do", "about grocify", 
      "explain grocify", "grocify info", "grocify details"
    ],
    answer:
      "Grocify is your one-stop online grocery shopping platform 🛒. We deliver fresh products to your doorstep with ease!",
  },
  {
    question: [
      "contact", "support", "help", "customer support", "contact grocify", 
      "help me", "need help", "customer care", "support team"
    ],
    answer: "📧 You can reach us at support@grocify.com. We’re available 24/7!",
  },
  {
    // 🚫 Negation cases for "help"
    question: [
      "i dont need help", "i don't need help", "no help needed", "not looking for help",
      "i'm fine", "dont help me"
    ],
    answer: "👍 Got it! I won’t bother you with help right now. Let me know if you change your mind!",
  },
  {
    question: [
      "bye","ok","okay","ja rha mai", "goodbye", "see you", "see ya", "byee", "byeee", "tata", "catch you later", "talk to you later"
    ],
    answer: "Goodbye! 👋 Have a wonderful day and visit Grocify again!",
  },
  {
    question: ["dont need help", "don't need help", "no help", "not need help", "don’t want help"],
    answer: "✅ Got it! I won’t bother you with help right now. If you change your mind, just type 'help' anytime!",
  },
];

export default localQA;
