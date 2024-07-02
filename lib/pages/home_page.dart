import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages.dart'; // Ensure you have this import correctly set up for VehicleList, SheduledChecks, and EquipmentList

class HomeController extends GetxController {
  var obsSelectedIndex = 0.obs;

  @override
  void onInit() {
    print("OnInit HomeController");
    super.onInit();
  }

  void setSelectedIndex(int index) {
    obsSelectedIndex.value = index;
    Get.back();
  }

  void logout() {
    Supabase.instance.client.auth.signOut();
    Get.offAll(const LoginPage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kilver Firetracker"),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.logout),
        //     onPressed: controller.logout,
        //   ),
        // ],
      ),
      body: Obx(
        () {
          return [
            const VehicleList(),
            const SheduledChecks(),
            const EquipmentList(),
            const Settings(),
          ][controller.obsSelectedIndex.value];
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return NavigationBar(
            selectedIndex: controller.obsSelectedIndex.value,
            onDestinationSelected: controller.setSelectedIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.fire_truck_rounded),
                label: 'Vehicles',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_rounded),
                label: 'Prüfung',
              ),
              NavigationDestination(
                icon: Icon(Icons.list_rounded),
                label: 'Prüflisten',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_rounded),
                label: 'Einstellungen',
              ),
            ],
          );
        },
      ),
    );
  }
}

class EquipmentList extends StatelessWidget {
  const EquipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: Column(
            children: [
              Text("Equipment $index"),
              Text("hello".tr),
            ],
          ),
        );
      },
    );
  }
}

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Vehicles"),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DetailPage()));
            },
            child: const Text("Test")),
      ],
    );
  }
}

class SheduledChecks extends StatelessWidget {
  const SheduledChecks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
