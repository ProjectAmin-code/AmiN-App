import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final String name;
  const Screen4({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 4")),
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'dummyImage.jpeg', // Replace with the path to your image
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          // Centered content on top of the image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Screen 4!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color for contrast
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "This is a dummy screen for navigation.",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
