import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafi/home/screens/video_call.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';// Import your VideoCall page here

class ViewAppointmentsPage extends StatefulWidget {
  const ViewAppointmentsPage({super.key});

  @override
  State<ViewAppointmentsPage> createState() => _ViewAppointmentsPageState();
}

class _ViewAppointmentsPageState extends State<ViewAppointmentsPage> {
  List<Map<String, String>> _bookedAppointments = [];

  @override
  void initState() {
    super.initState();
    _loadBookedAppointments();
  }

  void _loadBookedAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? appointments = prefs.getString('booked_appointments');
    if (appointments != null) {
      setState(() {
        _bookedAppointments = List<Map<String, String>>.from(json.decode(appointments));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Appointments', style: GoogleFonts.quicksand(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: ListView.builder(
        itemCount: _bookedAppointments.length,
        itemBuilder: (context, index) {
          final appointment = _bookedAppointments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                'Dr. ${appointment['doctor']} - Appointment on ${appointment['date']} at ${appointment['time']}',
                style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoCall(callID: appointment['callID']!),
                    ),
                  );
                },
                child: Text('Call Doctor', style: GoogleFonts.quicksand()),
              ),
            ),
          );
        },
      ),
    );
  }
}
