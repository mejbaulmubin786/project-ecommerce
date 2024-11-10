# What is required to run PHP scripts on a local machine? 
1. PHP interpreter installed
2. A web server like Apache or Nginx
3.  A text editor or IDE

# Visual Studio Code Extension for PHP. 
1. PHP Intelephense: is a popular PHP extension for VS Code that provides advanced features for productive PHP development. Some of the essential features of this extension include code auto-formatting, rich information tooltips on mouse hover, enhanced navigation between components, fast camel/underscore case code completion, and real-time error diagnostics for open files via powerful static code analysis.
2. PHP Intelephense
3. code runner: যদি এটি ইনস্টল থাকে তবে Ctrl+Shift+p চাপলে উপরে একটি সার্চ বক্স ওপেন হবে সেখানে লিখতে হবে run code এটি আসলে চাপ দিতে হবে তবে কোড সরা সরি রান হবে। আর সরা সরি করতে চাইলে সটকাট হচ্ছে ctrl+alt+n। আর পচ্ছন্দ মতো কিবোর্ড শটকার্ট করে নিতে চাইলে  file -> preference -> Keyboard Shortcuts then search (run code) আসার পর ডাবল ক্লিক করে সেখানে পছন্দ মতো সর্টকাট দিয়ে এন্টার করলে সেট হয়ে যাবে।
## How can you configure VS Code to use a specific PHP executable?
 গ্লোবাল পাথে PHP না থাকলে setting -> (search) code runner-> Run Code configuration-> Edit setting john.  এ গিয়ে যেখানে "php": "php" সেখানে দ্বিতীয় php এর জায়গায় php এর পাথ টা লিখে দিতে হবে।
![[WebDevelopment/Ostad/PHP/Ostad/Module-4/glovel-path.png]]
