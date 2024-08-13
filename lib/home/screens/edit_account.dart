import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/widgets/edit_item.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String gender = 'man';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                fixedSize: const Size(60, 50),
                elevation: 15,
              ),
              icon: const Icon(Icons.check, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account', style: GoogleFonts.quicksand(fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              EditItem(
                title: 'Photo',
                widget: Column(
                  children: [
                    Image.asset('assets/avatar.webp', height: 100, width: 100),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepPurple[400],
                      ),
                      child: Text(
                        'Upload Image',
                        style: GoogleFonts.quicksand(color: Colors.deepPurple[400]),
                      ),
                    ),
                  ],
                ),
              ),
              const EditItem(widget: TextField(), title: 'Name'),
              const SizedBox(height: 40),
              EditItem(
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "man";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "man" ? Colors.lightBlueAccent : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Iconsax.man,
                        color: gender == "man" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "woman";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "woman" ? Colors.lightBlueAccent : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Iconsax.woman,
                        color: gender == "woman" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                title: 'Gender',
              ),
              const SizedBox(height: 40),
              const EditItem(widget: TextField(), title: 'Age'),
              const SizedBox(height: 40),
              const EditItem(widget: TextField(), title: 'Email'),
            ],
          ),
        ),
      ),
    );
  }
}
