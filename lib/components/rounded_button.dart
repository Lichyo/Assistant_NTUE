import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, this.title, this.color, this.onPressed});

  final String? title;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 400.0,
          height: 42.0,
          child: Text(
            title!,
            style: kButtonTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}