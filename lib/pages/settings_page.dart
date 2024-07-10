import 'package:firetracker/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages.dart';



class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Column(
      children: [
        const Text("Settings"),
        ElevatedButton(
          onPressed: controller.logout,
          child: const Text("Logout"),
        ),
      ],
    );
  }
}
