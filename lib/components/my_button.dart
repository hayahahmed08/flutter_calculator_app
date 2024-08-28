import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants.dart';

class MyButton extends StatefulWidget {
  final String title ;
  const MyButton({super.key,required this.title,});
  @override
  State<MyButton> createState() => _MyButtonState();
}
class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding here
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(widget.title , style: headingTextStyle)),
        ),
      ),
    );
  }
}