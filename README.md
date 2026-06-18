MessageAI 💬🤖

A modern, elegant Flutter chat application integrated with OpenRouter AI.

📱 Features

Dual-Mode Dashboard: Instantly switch between traditional Messages and an AI Assistant using Cupertino segmented controls.

Notched Navigation Bar: A modern, curved bottom navigation bar with a centered floating action button (FAB).

Real-Time AI Chat: Powered by the OpenRouter API to stream smart responses directly into your application.

🛠️ Quick Start

1. Install Dependencies

Clone this repository and run the following command in your terminal:

flutter pub get


2. Configure your API Key

Create a file at lib/api/api_key.dart and add your OpenRouter key:

const String apiKey = 'YOUR_OPENROUTER_API_KEY';


3. Run the App

flutter run


🔒 Security Note

To protect your AI credentials and avoid unwanted charges, ensure that lib/api/api_key.dart is added to your .gitignore file so it is never pushed to public GitHub!
