import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/Utils/utils.dart';
import 'package:sampleproject/model/event.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({Key? key, this.event}) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
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
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingAction(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            buildTitle(),
            SizedBox(height: 12),
            buildDatTimePickers(),
          ]),
        ),
      ));

  List<Widget> buildEditingAction() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {},
            icon: Icon(Icons.done),
            label: Text('SAVE'))
      ];

  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        onFieldSubmitted: (_) {},
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  Widget buildDatTimePickers() => Column(
        children: [
          buildFrom(),
        ],
      );

  Widget buildFrom() => Buildheader(
    header : 'FROM',
    child : Row(
        children: [
          Expanded(
            flex: 2, // more space
            child: buildDropdownField(
                text: Utils.toDate(fromDate), onClicked: () {}),
          ),
          Expanded(
              child: buildDropdownField(
                  text: Utils.toTime(fromDate), onClicked: () {})),
        ],
      )
  );

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget Buildheader({
    required String header,
    required Widget child,
  }) => 
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(header, style: TextStyle(fontWeight: FontWeight.bold),)
    ],
  )
}
