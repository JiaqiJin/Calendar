import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/provider/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'Widget/calendar_widget.dart';
import 'Page/event_editing_page.dart';

// https://www.youtube.com/watch?v=2L8maZUY2hU
// https://www.youtube.com/watch?v=LoDtxRkGDTw
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final String title = 'Calendar Events App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.red,
          ),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventEditingPage(),
          )),
        ),
      );
}
