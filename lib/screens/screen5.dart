import 'package:aminapp/screens/screen6.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  final String name; // Variable to hold the name passed from Screen 6

  // Constructor to accept the name argument
  Screen5({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9E29B), // Soft yellow background
      appBar: AppBar(
        backgroundColor: Color(
          0xFFF9E29B,
        ), // Matching AppBar color to background
        elevation: 0, // No shadow for a flat look
        title: Text(
          "Apa Itu Imbuhan Awalan?",
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
              'Imbuhan awalan ialah imbuhan yang ditambah di hadapan kata dasar untuk membentuk kata baharu.',
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              'Awalan seperti ber-, meN-, di-, dan ter- membentuk kata baharu.',
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Subtitle and Example Words
            Text(
              'Contoh imbuhan awalan:',
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Example words displayed as a row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExampleWord(text: 'berlari'),
                ExampleWord(text: 'membaca'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExampleWord(text: 'dibeli'),
                ExampleWord(text: 'tertidur'),
              ],
            ),

            // Continue Button
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen6(name: name),
                  ), // Replace NextScreen with Screen6
                );
              },
              child: Text('Teruskan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0288D1), // Blue button
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
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
  const ExampleWord({required this.text});

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
