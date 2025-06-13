import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.deepPurple, // Using violet to match the button
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Registration Page Content Goes Here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 