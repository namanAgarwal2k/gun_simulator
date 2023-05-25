// //In this spark visibility issue and recoil is random

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gun_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GunWidget(
          shakeOffset: 5,
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   bool isVisible = false;
//   final _sparkWidgetKey = GlobalKey<SparkTransitionWidgetState>();
//   final _gunWidgetKey = GlobalKey<GunWidgetState>();
//
//   Future playSound() async {
//     final player = AudioPlayer();
//     await player.play(AssetSource('sounds/pistol.mp3'));
//   }
//
//   @override
//   void initState() {
//     ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
//       playSound();
//       setState(() {
//         if (!isVisible) {
//           isVisible = true;
//         }
//         _gunWidgetKey.currentState?.fire();
//       });
//
//       Future.delayed(const Duration(milliseconds: 10)).then((v) {
//         setState(() {
//           isVisible = false;
//         });
//       });
//       _gunWidgetKey.currentState?.fire();
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           fire();
//         },
//       ),
//       body: Stack(
//         children: [
//           SparkTransitionWidget(
//             key: _sparkWidgetKey,
//           ),
//           GunWidget(key: _gunWidgetKey, shakeOffset: 5),
//         ],
//       ),
//     );
//   }
//
//   void fire() {
//     _sparkWidgetKey.currentState?.sparkFire();
//     _gunWidgetKey.currentState?.fire();
//   }
// }
