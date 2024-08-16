import 'package:flutter/material.dart';
import 'package:app_todo_xd/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.black,
                ),

                const SizedBox(height: 50),

                // Welcome back, you've been missed
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // usename textField
                MyTextfield(),

                const SizedBox(height: 10),

                // Password textfield
                MyTextfield(),
                // forgot password?

                // or continue with

                // google + apple sign in buttons

                // not a member ? register now
              ],
            ),
          ),
        ));
  }
}
