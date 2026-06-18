import 'package:flutter/material.dart';
import 'package:second_draft/containers/events_box.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/man.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: const Text('David Beckham', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),),
          ),
          Center(
            child: Text('online', style: TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EventsBox(icons: Icon(Icons.add_a_photo_rounded, color: Colors.white,), text: 'Set a photo'),
              EventsBox(icons: Icon(Icons.edit, color: Colors.white), text: 'Edit Info'),
              EventsBox(icons: Icon(Icons.settings, color: Colors.white), text: 'Settings'),
              SizedBox(height: 10,),
             
            ],
          ),
          SizedBox(height: 50,),
          const Center(child: Text('No Posts yet...', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
          
        ],
      ),
    );
  }
}