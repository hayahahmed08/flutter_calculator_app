import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  var userInput = '';
  var answer = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.userInput.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 10), // Space between userInput and answer
                        Text(
                          widget.answer.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onPress: () {
                              widget.userInput = '';
                              widget.answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onPress: () {
                              widget.userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              addOperator('%');
                            },
                          ),
                          MyButton(
                            title: '/',
                            color: Color(0xffffa00a),
                            onPress: () {
                              addOperator('/');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          MyButton(
                            title: '7',
                            onPress: () {
                              widget.userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              widget.userInput += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            onPress: () {
                              widget.userInput += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '*',
                            color: Color(0xffffa00a),
                            onPress: () {
                              addOperator('*');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          MyButton(
                            title: '4',
                            onPress: () {
                              widget.userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              widget.userInput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              widget.userInput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            color: Color(0xffffa00a),
                            onPress: () {
                              addOperator('-');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          MyButton(
                            title: '1',
                            onPress: () {
                              widget.userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              widget.userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              widget.userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            color: Color(0xffffa00a),
                            onPress: () {
                              addOperator('+');
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            widget.userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            if (!widget.userInput.endsWith('.')) {
                              widget.userInput += '.';
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            if (widget.userInput.isNotEmpty) {
                              widget.userInput = widget.userInput
                                  .substring(0, widget.userInput.length - 1);
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: Color(0xffffa00a),
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addOperator(String operator) {
    if (widget.userInput.isNotEmpty) {
      String lastChar = widget.userInput[widget.userInput.length - 1];
      if ('+-*/%'.contains(lastChar)) {
        widget.userInput =
            widget.userInput.substring(0, widget.userInput.length - 1);
      }
    }
    widget.userInput += operator;
    setState(() {});
  }

  void equalPress() {
    try {
      Parser p = Parser();
      Expression expression = p.parse(widget.userInput);
      ContextModel contextModel = ContextModel();

      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      widget.answer = eval.toString();
    } catch (e) {
      widget.answer = 'Error';
    }
    setState(() {});
  }
}
