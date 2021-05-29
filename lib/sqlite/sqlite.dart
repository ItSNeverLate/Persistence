import 'package:flutter/material.dart';
import 'package:flutter_persistence/sqlite/DatabaseHelper.dart';
import 'package:flutter_persistence/sqlite/dog.dart';

class SQLite extends StatefulWidget {
  @override
  _SQLiteState createState() => _SQLiteState();
}

class _SQLiteState extends State<SQLite> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  List<Dog> dogs = [];

  @override
  void initState() {
    super.initState();
  }

  void getDogs() async {
    dogs = await DatabaseHelper.dogs();
  }

  @override
  Widget build(BuildContext context) {
    String name;
    int age;
    int id;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: dogs.length,
              itemBuilder: (context, index) => Text(dogs[index].name),
            ),
          ),
          TextField(
            controller: _idController,
            onChanged: (text) => id = int.parse(text) ?? 0,
          ),
          TextField(
            controller: _nameController,
            onChanged: (text) => name = text,
          ),
          TextField(
            controller: _ageController,
            onChanged: (text) => age = int.parse(text) ?? 0,
          ),
          Text('SQL'),
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.insertDog(Dog(id: id, name: name, age: age));
              getDogs();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
