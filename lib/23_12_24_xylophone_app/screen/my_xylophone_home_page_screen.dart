import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:soundpool/soundpool.dart';

import '../widget/piano_key_widget.dart';

final logger = SimpleLogger();

class MyXylophoneHomePageScreen extends StatefulWidget {
  const MyXylophoneHomePageScreen({super.key});

  @override
  State<MyXylophoneHomePageScreen> createState() =>
      _MyXylophoneHomePageScreenState();
}

class _MyXylophoneHomePageScreenState extends State<MyXylophoneHomePageScreen> {
  final Soundpool _soundpool =
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  final List<int> _soundIds = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    logger.info('qwerasdf start initState');
    initSoundPool();
  }

  Future<void> initSoundPool() async {
    int soundId = await rootBundle
        .load('assets/sounds/xylophone/do1.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/sounds/xylophone/re.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/mi.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/fa.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/sol.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/la.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/si.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sounds/xylophone/do2.wav')
        .then((value) => _soundpool.load(value));
    _soundIds.add(soundId);

    setState(() {
      _isLoading = false;
    });

    logger.info('qwerasdf $_soundIds');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Xylophone App',
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                XylophoneKeyBoard(
                  keyName: '도',
                  keyColor: Colors.red,
                  soundId: _soundIds[0],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '레',
                  keyColor: Colors.orange,
                  soundId: _soundIds[1],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '미',
                  keyColor: Colors.yellow,
                  soundId: _soundIds[2],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '파',
                  keyColor: Colors.green,
                  soundId: _soundIds[3],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '솔',
                  keyColor: Colors.blue,
                  soundId: _soundIds[4],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '라',
                  keyColor: Colors.indigo,
                  soundId: _soundIds[5],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '시',
                  keyColor: Colors.purple,
                  soundId: _soundIds[6],
                  soundpool: _soundpool,
                ),
                XylophoneKeyBoard(
                  keyName: '도',
                  keyColor: Colors.red,
                  soundId: _soundIds[7],
                  soundpool: _soundpool,
                ),
              ],
            ),
    );
  }
}
