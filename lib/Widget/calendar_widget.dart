import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:sampleproject/provider/event_provider.dart';
import 'package:sampleproject/model/event_data_source.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        initialDisplayDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: true);

          provider.setDate(details.date!);
          //showModalBottomSheet(context: context, builder: (context) => TaskWidget())
        });
  }
}
