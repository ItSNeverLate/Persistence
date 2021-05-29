import 'package:flutter/material.dart';
import 'package:flutter_persistence/sqlite/sqlite.dart';

import 'file:///D:/DEV/Flutter/flutter_persistence/lib/file/file_read_write.dart';
import 'file:///D:/DEV/Flutter/flutter_persistence/lib/prefs/shared_preference.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Keyboard(
          child: Column(
            children: [
              SharedPreference(),
              FileReadWrite(),
              SQLite(),
            ],
          ),
        ),
      ),
    );
  }
}
