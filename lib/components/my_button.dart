import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const MyButton({
    super.key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onPress, // Fixed the access to the onPress callback
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

