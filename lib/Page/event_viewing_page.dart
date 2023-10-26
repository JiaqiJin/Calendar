import 'dart:html';
import 'dart:js_util';
import 'package:sampleproject/Page/event_editing_page.dart';
import 'package:sampleproject/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/model/event.dart';
import 'package:sampleproject/provider/event_provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildViewingActions(context, event),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            buildDateTime(event),
            SizedBox(height: 32),
            Text(
              event.title,
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              event.description,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      );
    
  Widget buildDateTime(Event event) {
    return Column(
      children: [
        //buildDate(event.isAllDay? 'All.day' : 'From', event.from)
      ],
    )
  }

  List<Widget> buildViewingActions(BuildContext context, Event event) {
    IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context)=> EventEditingPage(event: event,)),
      ),
      );
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        final provider = Provider.of<EventProvider>(context, listen: true);

        //provider.deleteEvent(event);
      },
    );
  }
}
