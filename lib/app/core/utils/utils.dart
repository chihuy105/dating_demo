import 'package:dating_demo/all_file/all_file.dart';


class AppUtils {
  static Future<void> openMap(double lat, double lng) async {
    String googleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng')
            .toString();
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

