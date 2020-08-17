import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// 打电话
  static Future<void> makePhoneCall(phoneNum) async {
    String url = 'tel:$phoneNum';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
