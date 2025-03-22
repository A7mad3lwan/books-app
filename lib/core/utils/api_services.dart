import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AppServices {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

servicesInit() async {
  await Get.putAsync(() => AppServices().init());
}
