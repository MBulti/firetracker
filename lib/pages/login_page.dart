import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages.dart'; // Ensure you have this import correctly set up for HomePage

// Controller to manage login state
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final StreamSubscription<AuthState> authStateSubscription;

  @override
  void onInit() {
    super.onInit();
    print("LoginController onInit"); // Debug print to verify onInit is called

    // authStateSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((event) {
    //   if (event.session != null) {
    //     print("Auth state changed: User logged in");
    //     //Get.offAll(() => HomePage());
    //     //onClose();
    //   }
    // });
  }

  @override
  void onClose() {
    print("LoginController onClose"); // Debug print to verify onClose is called

    emailController.dispose();
    passwordController.dispose();
    //authStateSubscription.cancel();
    super.onClose();
  }

  Future<void> login() async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(const HomePage());
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> guestLogin() async {
    try {
      await Supabase.instance.client.auth.signInAnonymously();
      Get.offAll(const HomePage());
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: controller.login,
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: controller.guestLogin,
              child: const Text('Gast Login'),
            ),
          ],
        ),
      ),
    );
  }
}
