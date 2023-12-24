import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneKeyBoard extends StatelessWidget {
  final String keyName;
  final Color keyColor;
  final int soundId;
  final Soundpool soundpool;

  const XylophoneKeyBoard({
    super.key,
    required this.keyName,
    required this.keyColor,
    required this.soundId,
    required this.soundpool,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0 + 8.0 * soundId.toDouble(),
      ),
      child: GestureDetector(
        onTap: () {
          soundpool.play(soundId);
        },
        child: Container(
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
        ),
      ),
    );
  }
}
