import 'package:flutter/material.dart';
import 'screen5.dart'; // Import Screen 5

class Screen4 extends StatelessWidget {
  final String name; // Variable to hold the name passed from Screen 3

  // Constructor to accept the name argument
  const Screen4({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6E2A0), // Soft yellow background
      appBar: AppBar(
        backgroundColor: Color(
          0xFFF6E2A0,
        ), // Matching AppBar color to background
        elevation: 0, // No shadow for a flat look
        title: Text(
          "Apa Itu Imbuhan?",
          style: TextStyle(color: Colors.blue, fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context); // Go back on press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AmiN character Image
            Image.asset(
              'assets/aminPage4.png', // Replace with your AmiN character image
              height: 150,
            ),
            SizedBox(height: 20),

            // Welcome text with the passed name
            Text(
              'Hello, $name!', // Display the passed name
              style: TextStyle(fontSize: 24, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Description Text
            Text(
              'Imbuhan ialah morfem terikat yang tidak boleh berdiri sendiri.\n'
              'Imbuhan perlu ditambah pada kata dasar untuk membentuk kata baharu atau kata terbitan.',
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Subtitle and Example Words
            Text(
              'Kata berimbuhan ialah kata yang mempunyai imbuhan seperti:',
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Example words displayed as a row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExampleWord(text: 'berlari'),
                ExampleWord(text: 'tertawa'),
                ExampleWord(text: 'membaca'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExampleWord(text: 'menjadikan'),
                ExampleWord(text: 'dibelikan'),
                ExampleWord(text: 'masakan'),
              ],
            ),

            // Continue Button
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Screen5(name: name), // Passing 'name' to Screen 5
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0288D1), // Blue button
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Teruskan'),
            ),
          ],
        ),
      ),
    );
  }
}

// Example Word Widget
class ExampleWord extends StatelessWidget {
  final String text;
  const ExampleWord({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.yellow[700], // Color of the button
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
