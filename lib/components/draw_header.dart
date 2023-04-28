import 'package:flutter/material.dart';
import 'package:assistant/models/account/account.dart';

class DrawHeader extends StatelessWidget {
  const DrawHeader({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/images/profile.jpg'),
              ),
            ),
          ),
          Text(
            account.userName,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            account.email,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
