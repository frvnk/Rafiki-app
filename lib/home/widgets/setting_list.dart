
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafi/home/widgets/forward_btn.dart';

class SettingList extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? value;
  final Color iconColor;
  final Color bgColor;
  final Function() onTap;

  const SettingList({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.bgColor,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 20),
          Text(text, style:  GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          value != null ? Text(value!, style: GoogleFonts.quicksand(fontSize: 16, color: Colors.grey)) : const SizedBox(),
          const SizedBox(width: 20),
          ForwardBtn(onTap: onTap),
        ],
      ),
    );
  }
}
