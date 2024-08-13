import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mood_details.dart';

class MoodChecker extends StatefulWidget {
  const MoodChecker({super.key});

  @override
  State<MoodChecker> createState() => _MoodCheckerState();
}

class _MoodCheckerState extends State<MoodChecker> {
  String selectedMood = '';
  Color selectedMoodColor = Colors.transparent;

  final List<Map<String, dynamic>> moods = [
    {'icon': '🙂', 'text': 'Happy', 'color': Colors.yellow},
    {'icon': '😭', 'text': 'Sad', 'color': Colors.blue},
    {'icon': '😠', 'text': 'Angry', 'color': Colors.red},
    {'icon': '😐', 'text': 'Neutral', 'color': Colors.grey},
    {'icon': '😲', 'text': 'Surprised', 'color': Colors.purple},
    {'icon': '😕', 'text': 'Confused', 'color': Colors.orange},
  ];

  void selectMood(String mood, Color color) {
    setState(() {
      selectedMood = mood;
      selectedMoodColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mood Checker',
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How are you feeling today?',
              style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => selectMood(moods[index]['text'], moods[index]['color']),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: moods[index]['color'],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: selectedMood == moods[index]['text']
                            ? [
                          const BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 8.0,
                          ),
                        ]
                            : [
                          const BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            moods[index]['icon'],
                            style: GoogleFonts.quicksand(fontSize: 50),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            moods[index]['text'],
                            style: GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            selectedMood.isNotEmpty
                ? Column(
              children: [
                Text(
                  'You are feeling:',
                  style: GoogleFonts.quicksand(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  selectedMood,
                  style: GoogleFonts.quicksand(
                      fontSize: 22,
                      color: Colors.deepPurple[300],
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoodDetails(
                          mood: selectedMood,
                          moodColor: selectedMoodColor,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[300],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
