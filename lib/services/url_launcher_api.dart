import 'package:url_launcher/url_launcher.dart';

class UrlLauncherApi {
  Future<void> launchURL({required url}) async {
    url = Uri.parse(url);
    if (!await launchUrl(url)) {
      // throw Exception('Could not launch $url');
    }
  }
}
