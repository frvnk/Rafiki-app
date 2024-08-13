import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PutTextField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;
  const PutTextField({super.key, required this.text, required this.icon, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.quicksand(color: Colors.grey),
        border: const OutlineInputBorder(),
        prefixIcon: icon,
      ),
    );
  }
}
