import 'package:flutter/material.dart';

class PrayPage extends StatefulWidget {
  const PrayPage({Key? key}) : super(key: key);
  @override
  State<PrayPage> createState() => _PrayPageState();
}

class _PrayPageState extends State<PrayPage> {
  Image prayImage = const Image(
    image: AssetImage('lib/images/praying_picture.png'),
  );

  void knock() async {
    setState(() {
      prayImage = const Image(
        image: AssetImage('lib/images/knock.png'),
      );
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        prayImage = const Image(
          image: AssetImage('lib/images/praying_picture.png'),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '木魚敲敲祈禱區',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: knock,
              child: prayImage,
            ),
          ),
        ],
      ),
    );
  }
}


