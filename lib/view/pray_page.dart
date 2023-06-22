import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class PrayPage extends StatefulWidget {
  const PrayPage({Key? key}) : super(key: key);
  @override
  State<PrayPage> createState() => _PrayPageState();
}

class _PrayPageState extends State<PrayPage> {
  int count = 0;
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> setupAudioPlayer() async{
    final duration = await audioPlayer.setUrl(
        'https://youtu.be/Df_pGKwDJDU');
  }

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
      // appBar: AppBar(
      //   title: Text(
      //     'Temple',
      //     style: GoogleFonts.getFont('Delius', fontSize: 30.0),
      //   ),
      // ),
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
              'Praying Times：$count',
              style: GoogleFonts.getFont('Pacifico', fontSize: 35.0),
            ),
          ),
        ],
      ),
    );
  }
}
