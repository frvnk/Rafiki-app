
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/screens/articles.dart';
import 'package:rafi/home/screens/doc_card.dart';
import 'package:rafi/home/screens/mood_checker.dart';
import 'package:rafi/home/screens/video.dart';
import 'package:rafi/home/widgets/categories.dart';
import 'package:rafi/home/widgets/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAll = false; // State variable to track whether to show all doctors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi',
                          style: GoogleFonts.quicksand(fontSize: 18),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Juma',
                          style: GoogleFonts.quicksand(fontSize: 21),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[400],
                      ),
                      child: const Icon(
                        Iconsax.user,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // Status card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade300,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/animation.png'),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How\'re you feeling today?',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Let\'s check in with you',
                              style: GoogleFonts.quicksand(fontSize: 14),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD1FFC6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Let\'s begin',
                                  style: GoogleFonts.quicksand(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: "How can we help?",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Horizontal list view for categories
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Categories(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Articles()));
                    },image: 'assets/article.png', text: 'Articles'),
                    Categories(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  VideosPage(),
                        ),
                      );
                    },image: 'assets/vid.png', text: 'Videos'),
                    Categories(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MoodChecker(),
                        ),
                      );
                    },image: 'assets/mood.webp', text: 'Mood Checker'),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // Specialists list header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Specialists list',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showAll = !showAll;
                        });
                      },
                      child: Text(
                        showAll ? 'Show Less' : 'See All',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // Specialists list
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: showAll ? sampleData.length : 3, // Show 3 or all based on the state
                itemBuilder: (context, index) {
                  return DoctorCard(doctorData: sampleData[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
