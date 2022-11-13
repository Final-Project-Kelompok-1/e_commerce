import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:e_commerce/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AuthViewModel>(
          builder: (context, auth, _) => GestureDetector(
            onTap: () {
              auth.logout();
              Navigator.of(context).pushAndRemoveUntil(
                  NavigatorFadeTransitionHelper(
                    child: const LoginScreen(),
                  ),
                  (route) => false);
            },
            child: const Text("Logout"),
          ),
        ),
      ),
    );
  }
}
