// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      minLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // Background color
        labelText: 'Enter your message',
        labelStyle: TextStyle(color: Color.fromARGB(255, 78, 78, 78)), // Label text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Border radius
          borderSide: BorderSide.none, // No border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Border radius
          borderSide: BorderSide(
            color: Colors.grey, // Border color when enabled
            width: 1.0, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Border radius
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 212, 212, 212), // Border color when focused
            width: 2.0, // Border width
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Padding inside the TextField
      ),
      style: TextStyle(
        color: Colors.black, // Text color
        fontSize: 16.0, // Text size
      ),
      cursorColor: Colors.blue, // Cursor color
    );
  }
}
