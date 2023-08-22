
import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher {
  static Future<bool> webUrl(
      {required String url,
      LaunchMode mode = LaunchMode.inAppWebView}) async {
    Uri uri = Uri.parse(url);
    return await launchUrl(
      uri,
      mode: mode,
    );
  }

  static Future<bool> telUrl({required String tel}) async {
    Uri uri = Uri(
      scheme: "tel",
      path: tel,
    );
    return await launchUrl(
      uri,
    );
  }

  static Future<bool> mailUrl({
    required String email,
  }) async {
    Uri uri = Uri(
      scheme: "mailto",
      path: email,
    );
    return await launchUrl(uri);
  }

  static Future<bool> smsUrl({required String phoneNumber}) async {
    Uri uri = Uri(
      scheme: "sms",
      path: phoneNumber,
    );
    return await launchUrl(uri);
  }
}
