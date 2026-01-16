import 'package:flutter/material.dart';
import 'screen4.dart'; // Import Screen4

class Screen3 extends StatelessWidget {
  final String name;
  const Screen3({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color for screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AmiN Character (Pointing down) - Slightly increased size
            Image.asset(
              'assets/aminPage3.png', // Adjust the path to your image
              fit: BoxFit.contain,
              width: 240, // Increased width
              height: 240, // Increased height
            ),
            SizedBox(height: 20),
            // Speech Bubble - Slightly reduced size
            Container(
              padding: EdgeInsets.all(12), // Reduced padding
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
                "Pilih satu untuk bermula!",
                style: TextStyle(
                  fontSize: 22, // Slightly smaller font size
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', // Modern font family
                ),
              ),
            ),
            SizedBox(height: 30),
            // 4 buttons arranged 2x2 (No scroll)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  // First Row of Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Belajar Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Screen 4 when "Belajar" is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen4(name: name),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 150), // Fixed button size
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book, color: Colors.white, size: 40),
                            Text(
                              "Belajar",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Kuiz Button (disabled for now)
                      ElevatedButton(
                        onPressed: () {}, // No action
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow, // Yellow button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 150), // Fixed button size
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.note, color: Colors.white, size: 40),
                            Text(
                              "Kuiz",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Second Row of Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Main Button (disabled for now)
                      ElevatedButton(
                        onPressed: () {}, // No action
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Orange button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 150), // Fixed button size
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.gamepad, color: Colors.white, size: 40),
                            Text(
                              "Main",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Kemajuan Button (disabled for now)
                      ElevatedButton(
                        onPressed: () {}, // No action
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Green button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 150), // Fixed button size
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 40),
                            Text(
                              "Kemajuan",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
