import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PlatformFile? file;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      file = result?.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          file != null
              ? Expanded(
                child: Text(
                    file!.name,
                    style: const TextStyle(fontSize: 30.0),
                  ),
              )
              : const Text('data'),
          TextButton(onPressed: selectFile, child: const Text('Upload File'))
        ],
      ),
    );
  }
}
