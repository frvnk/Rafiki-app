// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/widgets/data.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookingPage extends StatefulWidget {
  final SampleData doctorData;

  const BookingPage({super.key, required this.doctorData});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  final List<String> _slots = ['9:00 AM', '10:00 AM', '11:00 AM', '2:00 PM'];
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

  void _bookAppointment(String slot) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> appointment = {
      'date': _selectedDay.toString().split(' ')[0],
      'time': slot,
      'doctor': widget.doctorData.doctorName,
      'callID': 'call_${widget.doctorData.doctorName}_${_selectedDay.toString().split(' ')[0]}_$slot',
    };
    setState(() {
      _bookedAppointments.add(appointment);
    });
    await prefs.setString('booked_appointments', json.encode(_bookedAppointments));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Booked slot: $slot on ${_selectedDay.toString().split(' ')[0]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment', style: GoogleFonts.quicksand(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDoctorProfile(context),
              const SizedBox(height: 20),
              _buildCalendar(),
              const SizedBox(height: 20),
              _buildAvailableSlots(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorProfile(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage(widget.doctorData.imageUrl),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${widget.doctorData.doctorName}',
                    style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.doctorData.specialty,
                    style: GoogleFonts.quicksand(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Iconsax.star, color: Colors.orange[200], size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.doctorData.rating,
                        style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.work, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '3yrs',
                        style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _selectedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onPageChanged: (focusedDay) {
        _selectedDay = focusedDay;
      },
    );
  }

  Widget _buildAvailableSlots(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Slots:',
          style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        for (String slot in _slots)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(slot, style: GoogleFonts.quicksand(fontSize: 16)),
              trailing: ElevatedButton(
                onPressed: () => _bookAppointment(slot),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Book', style: GoogleFonts.quicksand()),
              ),
            ),
          ),
      ],
    );
  }
}
