import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/model/event.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({Key? key, this.event}) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 1));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingAction(),
        ),
      );

  List<Widget> buildEditingAction() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {},
            icon: Icon(Icons.done),
            label: Text('SAVE'))
      ];
}
