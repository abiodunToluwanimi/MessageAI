import 'package:flutter/cupertino.dart'; // Required for CupertinoSlidingSegmentedControl
import 'package:flutter/material.dart';
import 'package:second_draft/pages/ai_screen.dart';
import 'package:second_draft/pages/message_screen.dart';
import 'package:second_draft/pages/my_profile.dart';

// 1. Updated the enum names to match your new tabs
enum MessageType { message, ai }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomIndex = 0;
  // 2. Set the default selection to Message
  MessageType _currentSelection = MessageType.message;

  //method
  // ADD THIS METHOD
  Widget _buildDynamicBody() {
    // If the Chat tab is selected, show the Message/AI toggle logic
    if (_currentBottomIndex == 0) {
      return _currentSelection == MessageType.message
          ? const MessageScreen()
          : const AiScreen();
    }
    // Otherwise, return the other screens based on the index
    else if (_currentBottomIndex == 1) {
      return const Center(child: Text("Search")); // Replace with your SearchScreen()
    } 
    else if (_currentBottomIndex == 2) {
      return const Center(child: Text("No Call Logs"));  // Replace with your CallsScreen()
    } 
    else {
      return MyProfile(); // Replace with your ProfileScreen()
    }
  }
  //toggle handle
  // ADD THIS METHOD
  Widget _buildTopCenterWidget() {
    if (_currentBottomIndex == 0) {
      // 1. If on the Chat tab, show your toggle!
      return CupertinoSlidingSegmentedControl<MessageType>(
        backgroundColor: const Color(0xFFF1F1F5),
        thumbColor: const Color(0xFF0055FF),
        groupValue: _currentSelection,
        children: {
          MessageType.message: _buildTabLabel('Message', _currentSelection == MessageType.message),
          MessageType.ai: _buildTabLabel('AI', _currentSelection == MessageType.ai),
        },
        onValueChanged: (MessageType? newValue) {
          if (newValue != null) {
            setState(() {
              _currentSelection = newValue;
            });
          }
        },
      );
    } else {
      // 2. If on any other tab, show a clean Title instead.
      // (You can change these names to whatever you want)
      List<String> titles = ["", "Search", "Recent Calls", "My Profile"];
      return Text(
        titles[_currentBottomIndex],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A1A1A),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 10, 
      ),
      //FAB
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: const CircleBorder(),
        backgroundColor: const Color(0x6600BFFF),
        elevation: 4,
        child: Icon(Icons.add, color: Colors.white, size: 23,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //BottomBar
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          notchMargin: 8.0,
          child: SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // --- Left Side Icons ---
              IconButton(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text, 
                  // Dynamic color based on selection!
                  color: _currentBottomIndex == 0 ? const Color(0xFF0055FF) : const Color(0xFFB0B0B0)
                ),
                onPressed: () {
                  setState(() { _currentBottomIndex = 0; });
                },
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.search, 
                  color: _currentBottomIndex == 1 ? const Color(0xFF0055FF) : const Color(0xFFB0B0B0)
                ),
                onPressed: () {
                  setState(() { _currentBottomIndex = 1; });
                },
              ),

              const SizedBox(width: 48), // Middle Gap

              // --- Right Side Icons ---
              IconButton(
                icon: Icon(
                  CupertinoIcons.phone, 
                  color: _currentBottomIndex == 2 ? const Color(0xFF0055FF) : const Color(0xFFB0B0B0)
                ),
                onPressed: () {
                  setState(() { _currentBottomIndex = 2; });
                },
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.person, 
                  color: _currentBottomIndex == 3 ? const Color(0xFF0055FF) : const Color(0xFFB0B0B0)
                ),
                onPressed: () {
                  setState(() { _currentBottomIndex = 3; });
                },
              ),
              ],
            ),
          ),
        ),



      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TOP HEADER ROW (Avatar, Selector, Bell)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
        
                  // control to use Message vs AI
                  _buildTopCenterWidget(),
        
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded, color: Colors.black87),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 20),
        
            // --- DYNAMIC SCREEN CONTENT ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _buildDynamicBody(),     // Displays when "AI" is selected
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabLabel(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8), // Adjusted padding so AI text sits nicely
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF9B9B9B),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

// --- Dynamic Sub-Screen Widgets ---


