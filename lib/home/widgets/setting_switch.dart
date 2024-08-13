import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingSwitch extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool value;
  final Color iconColor;
  final Color bgColor;
  final Function(bool value) onTap;

  const SettingSwitch({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.bgColor,
    required this.value,
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
          Text(value ? 'on' : 'off', style:  GoogleFonts.quicksand(fontSize: 16, color: Colors.grey)),
          const SizedBox(width: 20),
          CupertinoSwitch(value: value, onChanged: onTap),
        ],
      ),
    );
  }
}
