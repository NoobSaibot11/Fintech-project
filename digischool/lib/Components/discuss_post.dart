import 'package:flutter/material.dart';

class DiscussPost extends StatelessWidget {
  final String message;
  final String user;
  const DiscussPost({
    super.key,
    required this.message,
    required this.user,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0)
      ),
      margin: const EdgeInsets.only(top: 25,left: 25,right: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //User Profile Pic
          Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.background,
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.person_outlined,
                color: Theme.of(context).colorScheme.primary,),
              ),
              const SizedBox(
                width: 20,
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(user,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 8,
                fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text(message,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            ],
          ),
          
        ],
      ),
    );
  }
}