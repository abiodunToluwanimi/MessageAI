import 'package:flutter/material.dart';

class EventsBox extends StatelessWidget {
  const EventsBox({super.key,
  required this.icons,
  required this.text
  });

  final Icon icons;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:  const Color(0xFF0055FF),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: (){},
          child: Column(
            children: [
                icons,
                Text(text, style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}