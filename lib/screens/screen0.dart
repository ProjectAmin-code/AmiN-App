import 'dart:ui';

import 'package:flutter/material.dart';
import 'screen1.dart'; // Import Screen1

class Screen0 extends StatefulWidget {
  const Screen0({super.key});

  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  final TextEditingController _nameController = TextEditingController();

  // Function to navigate to Screen1
  void _goToScreen1() {
    if (_nameController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen1(name: _nameController.text),
        ),
      );
    } else {
      // Show a snack bar if no name is entered
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter your name")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90E0EF), // Light blue background color
      appBar: AppBar(
        backgroundColor: Color(0xFF90E0EF),
        elevation: 0, // Remove app bar shadow
        automaticallyImplyLeading: false, // Remove back button if present
      ),
      resizeToAvoidBottomInset:
          false, // Prevent resizing when the keyboard appears
      body: SingleChildScrollView(
        // Ensures the layout is scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stack to position the AmiN character and speech bubble
              SizedBox(
                width: double.infinity, // Provide full width
                height: 300, // Set a fixed height for the Stack
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // AmiN Image (character) - increased size
                    Positioned(
                      // Position character on the left side
                      top: 30, // Adjust to place the character higher
                      child: Image.asset('assets/aminPage0.png', height: 300),
                    ),

                    // Speech bubble (appears to come from AmiN's mouth) - reduced size
                    Positioned(
                      left:
                          174, // Position speech bubble near character's mouth
                      top: 130, // Adjust vertical alignment
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white, // Speech bubble background color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: Text(
                          "Hai! Siapa nama awak?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Glassy container for the input field and text below
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.6), // Glass effect
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Input field
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Taip nama awak di sini',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          // "Mula" button
                          ElevatedButton(
                            onPressed: _goToScreen1,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Button color
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ), // Rounded corners for button
                              ),
                            ),
                            child: Text(
                              "Mula",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // "Guna nama panggilan sahaja"
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Guna nama panggilan sahaja",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
