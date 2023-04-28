import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PrayPage extends StatefulWidget {
  const PrayPage({Key? key}) : super(key: key);
  @override
  State<PrayPage> createState() => _PrayPageState();
}

class _PrayPageState extends State<PrayPage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    count = 0;
  }
  Image prayImage = const Image(
    image: AssetImage('lib/images/praying_picture.png'),
  );

  void knockAndCounting() async {
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
    count++;
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
            flex: 3,
            child: GestureDetector(
              onTap: knockAndCounting,
              child: prayImage,
            ),
          ),
          Expanded(
            child: Text(
              '本次祈禱次數：$count',
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
