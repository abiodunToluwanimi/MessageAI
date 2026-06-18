import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final String name;
  final String message;
  final String avatarIcon;
  final int unreadCount;
  final String time; 
  final VoidCallback? onTap; 

  const ChatBox({
    super.key,
    required this.name,
    required this.message,
    required this.avatarIcon,
    required this.unreadCount,
    required this.time,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F7),
        borderRadius: BorderRadius.circular(20),
      ),
      // This forces the InkWell ripple animation to stay strictly inside. the 20-radius corners!
      clipBehavior: Clip.antiAlias, 
      
      // 1. InkWell acts as our tappable button!
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (){}, 
          // 2. Padding gives the row breathing room so it doesn't touch the container edges
          child: Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- LEADING AVATAR ---
                CircleAvatar(
                  backgroundImage: AssetImage(avatarIcon),
                  radius: 30,
                ),
                
                const SizedBox(width: 15), // Spacing between avatar and text
        
                // --- MIDDLE TEXT ---
                // Expanded forces the text to take up all available middle space, 
                // safely pushing the time/badge completely to the right edge.
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
        
                const SizedBox(width: 10), // Spacing between text and trailing items
        
                // --- TRAILING INFO (Time & Icons) ---
                // No more height limits! This will fit perfectly.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFC0C0C0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    unreadCount > 0
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE94B4B),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.done_all_rounded,
                            color: Color(0xFF4ADE80),
                            size: 16,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}