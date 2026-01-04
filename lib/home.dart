import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var userinput = '';
var output = '';

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userinput.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        output.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),

              //Keypad
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(
                          btitle: "AC",
                          onPress: () {
                            userinput = '';
                            output = '';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "+/-",
                          onPress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "%",
                          onPress: () {
                            userinput += '%';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "/",
                          bcolor: Color(0xffffa00a),
                          onPress: () {
                            userinput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          btitle: "7",
                          onPress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "8",
                          onPress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "9",
                          onPress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "x",
                          bcolor: Color(0xffffa00a),
                          onPress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          btitle: "4",
                          onPress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "5",
                          onPress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "6",
                          onPress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "-",
                          bcolor: Color(0xffffa00a),
                          onPress: () {
                            userinput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          btitle: "1",
                          onPress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "2",
                          onPress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "3",
                          onPress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "+",
                          bcolor: Color(0xffffa00a),
                          onPress: () {
                            userinput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          btitle: "0",
                          onPress: () {
                            userinput += '0';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: ".",
                          onPress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "DEL",
                          onPress: () {
                            userinput = userinput.substring(0,
                              userinput.length - 1,
                            );
                            setState(() {});
                          },
                        ),
                        Button(
                          btitle: "=",
                          bcolor: Color(0xffffa00a),
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

  void equalPress() {
    setState(() {
      String finaluserinput = userinput;
      finaluserinput = userinput.replaceAll('x', '*');
      var p = ShuntingYardParser();
      Expression expression = p.parse(finaluserinput);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      output = eval.toString();
    });
  }
}
