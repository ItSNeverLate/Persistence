import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  @override
  _SharedPreferenceState createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  bool flag = false;

  @override
  void initState() {
    super.initState();

    initialFlag();
  }

  void initialFlag() async {
    final prefs = await SharedPreferences.getInstance();
    setFlag(prefs.getBool('dark_mode') ?? false);
  }

  void setFlag(bool value) async {
    setState(() {
      flag = value;
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark_mode', value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Dark Mode'),
              Switch(value: flag, onChanged: (value) => setFlag(value)),
            ],
          ),
          Text('Shared Preferences'),
        ],
      ),
    );
  }
}
