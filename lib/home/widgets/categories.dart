import 'package:flutter/material.dart';
class Categories extends StatelessWidget {
  final String image,text;
  final VoidCallback onTap;
  const Categories({super.key, required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue.shade200,
          ),
          child: Column(
            children: [
              Image.asset(image,
                height: 30,
              ),
              const SizedBox(width: 10,),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
