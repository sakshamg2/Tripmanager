import 'package:flutter/material.dart';
import 'package:tripmanager/pages/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 10),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Posted on July 2, 2023',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            post.text,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // if (post.images.isNotEmpty)
          Image.asset(
            post.images[0],
            height: 200,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Handle like button press
                },
                icon: const Icon(Icons.thumb_up),
                label: const Text('Like'),
                style: ElevatedButton.styleFrom(primary: Color(0xFF0081A7)),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle dislike button press
                },
                icon: const Icon(Icons.thumb_down),
                label: const Text('Dislike'),
                style: ElevatedButton.styleFrom(primary: Color(0xFF0081A7)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Comment section can be added here
        ],
      ),
    );
  }
}
