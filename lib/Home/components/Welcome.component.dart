import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  final String userName;
  final String dateText;
  final String imageUrl;

  const HelloWorld({
    super.key,
    required this.userName,
    required this.dateText,
    required this.imageUrl,
  });

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return '¡Buenos días, $userName!';
    } else if (hour >= 12 && hour < 18) {
      return '¡Buenas tardes, $userName!';
    } else {
      return '¡Buenas noches, $userName!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA3AEE4),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreeting(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateText,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ],
      ),
    );
  }
}
