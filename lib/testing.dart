import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: TextButton(
            onPressed: (){
              final DateTime dateOne = DateTime(2022, 8, 30, 16, 59, 59);
              final DateTime dateTwo = DateTime(1980, 4, 29, 13, 45, 45);
              final Duration duration = dateOne.difference(dateTwo);
              print(duration.inDays);
            },
            child: Text('dfgjashgiflh'),
          ),
        ),
      ),
    );
  }
}
