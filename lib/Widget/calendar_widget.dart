import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialDisplayDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
    );
  }
}
