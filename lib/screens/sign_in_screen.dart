import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task_state_management_2/provider/auth.dart';
import 'package:task_state_management_2/screens/user_info_screen.dart';
import 'package:task_state_management_2/utils/decorations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: Decorations.inputDecoration.copyWith(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const Gap(24),
              TextField(
                controller: password,
                obscureText: true,
                decoration: Decorations.inputDecoration.copyWith(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const Gap(32),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<Auth>(context, listen: false).signIn(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserInfoScreen(),
                        ));
                  },
                  child: const Text('SIGN IN')),
            ]),
      ),
    );
  }
}
