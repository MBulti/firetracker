import 'package:firetracker/pages/pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsController extends GetxController {
  void logout() {
    Supabase.instance.client.auth.signOut();
    Get.offAll(const LoginPage());
  }
}