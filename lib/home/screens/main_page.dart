
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/screens/chat_screen.dart';
import 'package:rafi/home/screens/home.dart';
import 'package:rafi/home/screens/profile.dart';
import 'package:rafi/home/screens/video_call.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> pages = [
    const HomeScreen(),
    const VideoCall(),
    const ChatScreen(doctorId: 'doctorId', userId: 'userId'),
    const Profile(),
  ];

  int _currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade400,
        unselectedItemColor: Colors.blue.shade200,
        currentIndex: _currentPage,
          onTap: (value){
          setState(() {
            _currentPage = value;
          });
        },
          items: const[
        BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.video),
            label: 'VideoCall'
        ),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: 'Chat'
        ),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile'
        ),
      ]),
    );
  }
}
