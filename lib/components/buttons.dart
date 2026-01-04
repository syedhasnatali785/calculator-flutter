import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.btitle,
    this.bcolor = const Color(0xff5a5a5a),
    required this.onPress,
  });
  final String btitle;
  final Color bcolor;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(color: bcolor, shape: BoxShape.circle),
            child: Center(
              child: Text(
                btitle,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
