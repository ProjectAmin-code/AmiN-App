import 'package:flutter/material.dart';
import 'screen3.dart'; // Import Screen3

class Screen2 extends StatelessWidget {
  final String name;
  const Screen2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color for screen
      body: Stack(
        children: [
          // Speech Bubble
          Positioned(
            top: 100, // Adjust position of speech bubble
            left: 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Text(
                "Saya akan bantu awak belajar imbuhan awalan meN- dengan cara yang seronok dan mudah!",
                style: TextStyle(
                  fontSize: 24, // Font size for readability
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', // Modern font family
                ),
              ),
            ),
          ),

          // AmiN Image (increased size)
          Positioned(
            bottom: 120, // Position just above the button
            left: 30,
            right: 30,
            child: Image.asset(
              'assets/aminPage2.png', // Adjust the path to your image
              fit: BoxFit.contain, // Ensure the image is properly scaled
              width:
                  MediaQuery.of(context).size.width *
                  0.7, // Increased image size
              height: 320, // Increased height
            ),
          ),

          // Speaker Icon (non-functional for now)
          Positioned(
            top: 20,
            right: 20,
            child: Icon(Icons.volume_up, color: Colors.white, size: 40),
          ),

          // Yellow Button
          Positioned(
            bottom: 40, // Position button at the bottom
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to Screen3 on button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3(name: name)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Yellow button color
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Jom kita mula",
                style: TextStyle(
                  fontSize: 20, // Font size for the button
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
