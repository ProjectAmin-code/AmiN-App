import 'package:flutter/material.dart';
import 'screen2.dart'; // Import Screen2

class Screen1 extends StatelessWidget {
  final String name;
  const Screen1({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          // Navigate to Screen2 when the screen is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen2(name: name)),
          );
        },
        child: Stack(
          children: [
            // Full-screen background image
            SizedBox.expand(
              child: Image.asset(
                'assets/classroom_background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Content layer with speech bubbles and AmiN image
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:
                        2, // Increased space between AmiN and speech bubbles
                  ),
                  // Speech bubble 1
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 30, right: 30),
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
                      "Hi semua! Saya AmiN.",
                      style: TextStyle(
                        fontSize:
                            24, // Increased font size for better visibility
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Modern font family
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ), // Increased space between speech bubbles
                  // Speech bubble 2
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 30, right: 30),
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
                      "Selamat datang ke Kelas Imbuhan Awalan meN-.",
                      style: TextStyle(
                        fontSize:
                            24, // Increased font size for better visibility
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Modern font family
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 500),
            // Positioned AmiN image at the bottom with increased size
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/aminPage1.png',
                fit: BoxFit.contain, // Ensure the image is properly scaled
                width:
                    MediaQuery.of(context).size.width *
                    0.7, // Increased image width
                height: 300, // Increased image height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
