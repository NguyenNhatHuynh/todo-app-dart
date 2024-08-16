import 'package:flutter/material.dart';
import 'package:app_todo_xd/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                MyTextfield(
                  controller: usernameController,
                  hinText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password textfield
                MyTextfield(
                  controller: passwordController,
                  hinText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in buttons

                // or continue with

                // google + apple sign in buttons

                // not a member ? register now
              ],
            ),
          ),
        ));
  }
}
