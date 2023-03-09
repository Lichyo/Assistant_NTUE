import 'package:flutter/material.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/components/task/task_list.dart';

class ClassContainer extends StatelessWidget {
  ClassContainer({
    super.key,
    required this.curriculum,
  });
  Curriculum curriculum;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        curriculum.className,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
      ),
      subtitle: Text(
        curriculum.time,
        style: TextStyle(color: Colors.grey.shade800),
      ),
      isThreeLine: true,
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TaskList(),
            ),
          );
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
          size: 35.0,
        ),
      ),
    );
  }
}
