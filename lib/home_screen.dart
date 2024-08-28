import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/components/my_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyButton(title: "Login",),
            MyButton(title: "Sign Up",),
            MyButton(title: "facebook"),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

