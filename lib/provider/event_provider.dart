import 'package:flutter/cupertino.dart';
import 'package:sampleproject/model/event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectDate = DateTime.now();

  DateTime get selectDate => _selectDate;

  void setDate(DateTime date) => _selectDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  void addEvent(Event event) {
    _events.add(event);

    notifyListeners();
  }
}
