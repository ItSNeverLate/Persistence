import 'package:flutter/material.dart';
import 'file:///D:/DEV/Flutter/flutter_persistence/lib/file/file_storage.dart';

class FileReadWrite extends StatefulWidget {
  final fileStorage = FileStorage();

  @override
  _FileReadWriteState createState() => _FileReadWriteState();
}

class _FileReadWriteState extends State<FileReadWrite> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initialFlag();
  }

  void initialFlag() async {
    final text = await widget.fileStorage.readFile();
    _textController.text = text;
  }

  void setText(String text)  {
    widget.fileStorage.writeFile(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(controller: _textController, onChanged:(text) => setText(text),),
          Text('File Read/Write'),
        ],
      ),
    );
  }
}
