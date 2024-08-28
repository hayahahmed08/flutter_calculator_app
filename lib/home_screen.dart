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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Align buttons evenly
                children: [
                  MyButton(title: 'AC',onPress: (){
                    print('tap');
                  },),
                  SizedBox(width: 10,),
                  MyButton(title: '+/-', onPress: (){
                    print('tap');
                  },),
                  SizedBox(width: 10, ),
                  MyButton(title: '%', onPress: (){
                    print('tap');
                  },),
                  SizedBox(width: 10,),
                  MyButton(title: '/',color: Color(0xffffa00a), onPress: (){
                    print('tap');
                  },),



                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


