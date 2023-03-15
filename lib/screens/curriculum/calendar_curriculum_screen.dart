import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCurriculumScreen extends StatefulWidget {
  const CalendarCurriculumScreen({Key? key}) : super(key: key);

  @override
  State<CalendarCurriculumScreen> createState() =>
      _CalendarCurriculumScreenState();
}

class _CalendarCurriculumScreenState extends State<CalendarCurriculumScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2003),
            lastDay: DateTime(2030),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
        ],
      ),
    );
  }
}
