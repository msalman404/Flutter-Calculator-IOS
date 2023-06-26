import 'package:calculator_ios/components.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var userInput = '';
var asnwer = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                Text(
                  userInput.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  asnwer.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      title: 'AC',
                      onPress: () {
                        userInput = '';
                        asnwer = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+/-',
                      onPress: () {
                        userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '%',
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '/',
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                      color: const Color(0xffffa00a),
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '9',
                      onPress: () {
                        userInput += '9';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'x',
                      onPress: () {
                        userInput += '*';
                        setState(() {});
                      },
                      color: const Color(0xffffa00a),
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '-',
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                      color: const Color(0xffffa00a),
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+',
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                      color: const Color(0xffffa00a),
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '.',
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'DEL',
                      onPress: () {
                        if (userInput.isEmpty) {
                          userInput = '';
                          setState(() {});
                        } else {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        }
                      },
                    ),
                    MyButton(
                      title: '=',
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                      color: const Color(0xffffa00a),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    asnwer = eval.toString();
  }
}
