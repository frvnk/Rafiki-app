import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodDetails extends StatelessWidget {
  final String mood;
  final Color moodColor;

  const MoodDetails({super.key, required this.mood, required this.moodColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$mood Details', style:  GoogleFonts.quicksand(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: moodColor,
      ),
      body: Center(
        child: Text(
          'You are feeling $mood',
          style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: moodColor),
        ),
      ),
    );
  }
}
