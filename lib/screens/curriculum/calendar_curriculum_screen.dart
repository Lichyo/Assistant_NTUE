import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCurriculumScreen extends StatelessWidget {
  const CalendarCurriculumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2003),
            lastDay: DateTime(2030),
          ),
        ],
      ),
    );
  }
}
