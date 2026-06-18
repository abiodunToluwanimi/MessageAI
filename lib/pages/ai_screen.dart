import 'package:flutter/material.dart';
import 'package:second_draft/components/get_open_router_response.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  String answer = '';
  bool isLoading = false; // Add a loading tracker
  TextEditingController controller = TextEditingController();

  void _talkToAi() async {
    // If the text box is empty, do nothing
    if (controller.text.trim().isEmpty) return;
    
    // Hide keyboard
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true; // Start loading
      answer = ''; // Clear previous answer
    });

    String theAnswer = await getOpenRouterResponse(controller.text);
    
    setState(() {
      answer = theAnswer;
      isLoading = false; // Stop loading
      controller.clear(); // Clear the input box
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'What\'s on your mind?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // --- TEXT FIELD ---
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Ask me something',
                hintText: 'Who is David beckham?',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Color(0xFF0055FF)),
                ),
                filled: true,
                fillColor: const Color(0xFFF1F1F5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Color(0xFF0055FF)),
                ),
                suffixIcon: IconButton(
                  onPressed: isLoading ? null : _talkToAi, // Disable button while loading
                  icon: const Icon(Icons.send),
                  color: const Color(0xFF0055FF),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // --- DYNAMIC AI RESPONSE AREA ---
            if (isLoading)
              const CircularProgressIndicator(color: Color(0xFF0055FF)) // Show spinner
            else
              Text(
                answer,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5, // Better line spacing for paragraphs
                ),
              ),
              SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}