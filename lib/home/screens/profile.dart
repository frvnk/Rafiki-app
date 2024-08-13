
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/screens/edit_account.dart';
import 'package:rafi/home/screens/home.dart';
import 'package:rafi/home/widgets/setting_list.dart';
import 'package:rafi/home/widgets/setting_switch.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Profile', style: GoogleFonts.quicksand(fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
               Text('Account', style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/avatar.webp'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Frank Juma', style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                         Text('rafiki account', style: GoogleFonts.quicksand(fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccount()));
                          },
                          child:  Text(
                            'Edit Account',
                            style: GoogleFonts.quicksand(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text('Profile', style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              SettingList(
                icon: Iconsax.global,
                text: 'Language',
                iconColor: Colors.red,
                bgColor: Colors.red.shade200,
                value: 'English',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingList(
                icon: Iconsax.notification,
                text: 'Notification',
                iconColor: Colors.purple,
                bgColor: Colors.purple.shade200,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                icon: Iconsax.moon,
                text: 'Dark Mode',
                iconColor: Colors.green,
                bgColor: Colors.green.shade200,
                onTap: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                value: isDarkMode,
              ),
              const SizedBox(height: 20),
              SettingList(
                icon: Iconsax.info_circle,
                text: 'Help',
                iconColor: Colors.blue,
                bgColor: Colors.blue.shade200,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
