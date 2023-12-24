import 'package:flutter/material.dart';

class XylophoneKeyBoard extends StatelessWidget {
  final String keyName;
  final Color keyColor;

  const XylophoneKeyBoard({
    super.key,
    required this.keyName,
    required this.keyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: double.infinity,
      color: keyColor,
      alignment: Alignment.center,
      child: Text(
        keyName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
