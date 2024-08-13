import 'package:rafi/home/screens/appointments.dart';
import 'package:rafi/home/widgets/data.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';// Ensure this import is added at the top

class DoctorCard extends StatelessWidget {
  final SampleData doctorData;

  const DoctorCard({super.key, required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage(doctorData.imageUrl),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorData.doctorName,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    doctorData.specialty,
                    style: GoogleFonts.quicksand(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Iconsax.star,
                        color: Colors.orange[200],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        doctorData.rating,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontFamily: 'quicksand', fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.work, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '3yrs',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontFamily: 'quicksand', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(doctorData: doctorData),
                  ),
                );
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
