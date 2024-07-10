import 'package:firetracker/controller/controller.dart';
import 'package:firetracker/utils/structures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Widget> lsWidgets = const <Widget>[
    VehicleList(),
    EquipmentList(),
    CheckList(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final shedulecontroller = Get.put(SheduleController());

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
          () => lsWidgets.elementAt(controller.obsSelectedIndex.value.index)),
      floatingActionButton: Obx(() {
        return controller.obsSelectedIndex.value == TabItem.checklist
            ? FloatingActionButton(
                onPressed: shedulecontroller.onFloatingButtonPressed,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            : Container();
      }),
      bottomNavigationBar: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NavigationBar(
              selectedIndex: controller.obsSelectedIndex.value.index,
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
                  icon: Icon(Icons.checklist_rounded),
                  label: 'Prüflisten',
                ),
                // NavigationDestination(
                //   icon: Icon(Icons.settings_rounded),
                //   label: 'Einstellungen',
                // ),
              ],
            ),
          );
        },
      ),
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

class EquipmentList extends StatelessWidget {
  const EquipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CheckList extends StatelessWidget {
  const CheckList({super.key});

  @override
  Widget build(BuildContext context) {
    final SheduleController controller = Get.find();
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          child: Column(
            children: [
              Text("Equipment $index"),
              Text("hello".tr),
              ElevatedButton(
                onPressed: controller.onFloatingButtonPressed,
                child: const Text("Button"),
              )
            ],
          ),
        );
      },
    );
  }
}
