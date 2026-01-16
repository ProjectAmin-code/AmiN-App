import 'package:flutter/material.dart';
import 'screens/screen0.dart'; // Import Screen0

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amin App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Screen0(), // Start with Screen0
    );
  }
}
