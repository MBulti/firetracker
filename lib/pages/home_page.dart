import 'package:flutter/material.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kilver Firetracker"),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.fire_truck_rounded),
            label: 'Verlastung',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Prüfung',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_rounded),
            label: 'Prüflisten',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: [
        const VehicleList(),
        const SheduledChecks(),
        const EquipmentList()
      ][selectedIndex],
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
              const Text("Test"),
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
