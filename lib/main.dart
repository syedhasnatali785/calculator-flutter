import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(BC());
}
class BC extends StatelessWidget {
   const BC({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home(),
    );
  }
}
