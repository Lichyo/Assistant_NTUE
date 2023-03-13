import 'package:flutter/material.dart';
import 'package:assistant/models/curriculum/curriculum.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer({
    super.key,
    required this.curriculum,
  });
  final Curriculum curriculum;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      child: ListTile(
        title: Text(
          curriculum.className,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
        subtitle: Text(
          curriculum.time,
          style: TextStyle(color: Colors.grey.shade800),
        ),
        isThreeLine: true,
      ),
    );
  }
}
