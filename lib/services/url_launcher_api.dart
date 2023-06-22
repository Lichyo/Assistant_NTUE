import 'package:url_launcher/url_launcher.dart';

class UrlLauncherApi {

  static const String _githubIssueReportURI = 'https://github.com/Lichyo/Assistant_NTUE/issues';
  static const String _githubPullRequestURI = 'https://github.com/Lichyo/Assistant_NTUE/pulls';

  Future<void> _launchURL({uri}) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch uri : $uri');
    }
  }

  Future<void> reportByPullRequest() async{
    Uri uri = Uri.parse(_githubPullRequestURI);
    launchUrl(uri);
  }

  Future<void> reportByIssue() async{
    Uri uri = Uri.parse(_githubIssueReportURI);
    launchUrl(uri);
  }



  Future<void> reportByEmail({required subject, required body}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'lichyo003@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'NTUE Assistant Issue Report : $subject',
        'body': body,
      }),
    );
    launchUrl(emailLaunchUri);
  }
}
