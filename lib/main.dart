import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/pages.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://redngdqvftdapouzjjtc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJlZG5nZHF2ZnRkYXBvdXpqanRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4NDA2MDgsImV4cCI6MjAzMDQxNjYwOH0.I1KJMaECKpvhBdvOiTVsqKWD6OvwtOgyJ-kPV9FGD0g');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kilver Firetracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: getSessionPage(),
    );
  }
}

Widget getSessionPage() {
  if (Supabase.instance.client.auth.currentSession != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
}
