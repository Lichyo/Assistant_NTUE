import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/rounded_button.dart';
import 'package:assistant/services/url_launcher_api.dart';

class IssueReportScreen extends StatelessWidget {
  IssueReportScreen({Key? key}) : super(key: key);
  String subject = '';
  String body = '';
  final UrlLauncherApi _urlLauncherApi = UrlLauncherApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report',
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Report a bug or request a feature',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Subject',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Subject',
                  ),
                  onChanged: (value) {
                    subject = value;
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Body',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                TextField(
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a description',
                  ),
                  onChanged: (value) {
                    body = value;
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _urlLauncherApi.reportByPullRequest(),
            child: const Text(
              'or... report by pull request',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.blue,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: RoundedButton(
              color: Colors.blueAccent,
              title: 'Submit',
              onPressed: () =>
                  _urlLauncherApi.reportByEmail(subject: subject, body: body),
            ),
          ),
        ],
      ),
    );
  }
}
