import 'package:flutter/material.dart';
import 'package:second_draft/components/messages.dart';
import 'package:second_draft/containers/chat_box.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Messages messageInstance = Messages();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // 1. REMOVED SingleChildScrollView entirely.
      // ListView natively handles scrolling and takes up the remaining screen space safely.
      child: ListView.builder(
        // Adding a little padding around the whole list so it looks cleaner
        padding: const EdgeInsets.all(16.0),
        itemCount: messageInstance.messageList.length,
        itemBuilder: (context, index) {
          final currentMessage = messageInstance.messageList[index];
          
          return ChatBox(
            name: currentMessage['name'], 
            message: currentMessage['message'],
            avatarIcon: currentMessage['avatarIcon'], 
            time: currentMessage['time'], 
            // 2. PARSED the string to an int so it matches the ChatBox required type
            unreadCount: int.parse(currentMessage['unreadAccount'].toString()),
          );
        },
      ),
    );
  }
}