import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.itemCallback,
  });

  final IconData icon;
  final String text;
  final VoidCallback itemCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemCallback,
      child: Container(
        padding: const EdgeInsets.only(left: 30.0, top: 20.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.grey.shade500,
            ),
            const SizedBox(
              width: 50.0,
            ),
            Text(
              text,
              style: kMenuTextStyle.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
