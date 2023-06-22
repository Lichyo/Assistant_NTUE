import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:assistant/services/url_launcher_api.dart';

class IssueReportScreen extends StatelessWidget {
  const IssueReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report',
          style: kAppBarTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Report a bug or request a feature',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.0,
              ),
            ),
            GestureDetector(
              onTap: () async{
                UrlLauncherApi().launchURL(url: 'https://github.com/Lichyo/Assistant_NTUE/pulls');
              },
              child: Text(
                'or... pull request',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  color: Colors.blue.shade700
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
