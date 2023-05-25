//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// // import 'package:sensors/sensors.dart';
// // import 'package:audioplayers/audio_cache.dart';
//
// void main() => runApp(GunSimulatorApp());
//
// class GunSimulatorApp extends StatefulWidget {
//   @override
//   _GunSimulatorAppState createState() => _GunSimulatorAppState();
// }
//
// class _GunSimulatorAppState extends State<GunSimulatorApp> {
//   AudioCache audioCache = AudioCache();
//   List<double> acceleration = [10, 5, 5];
//   @override
//   void initState() {
//     super.initState();
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       setState(() {
//         acceleration = [event.x, event.y, event.z];
//       });
//     });
//   }
//
//   void playSound() {
//     audioCache.load('sounds/pistol.mp3');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Gun Simulator App'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'assets/guns/classicPistol.png',
//               height: 300,
//               width: 300,
//               color: Color.fromRGBO(
//                 (acceleration[0].abs() * 255).toInt(),
//                 (acceleration[1].abs() * 255).toInt(),
//                 (acceleration[2].abs() * 255).toInt(),
//                 1,
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextButton(
//               onPressed: playSound,
//               child: const Text('Fire'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////
//same without sensor plus
//
// class GunSimulator extends StatefulWidget {
//   @override
//   _GunSimulatorState createState() => _GunSimulatorState();
// }
//
// class _GunSimulatorState extends State<GunSimulator> {
//   AudioPlayer _audioPlayer = AudioPlayer();
//   @override
//   void initState() {
//     super.initState();
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
//         _playSound();
//         setState(() {});
//       }
//     });
//   }
//
//   Future<void> _playSound() async {
//     await _audioPlayer.play(AssetSource('sounds/pistol.mp3'));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _audioPlayer.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gun Simulator'),
//       ),
//       body: Center(
//         child: AnimatedContainer(
//           color: Colors.black,
//           duration: Duration(milliseconds: 100),
//           transform: Matrix4.rotationZ(1),
//           child: Image.asset("assets/guns/classicPistol.png"),
//         ),
//       ),
//     );
//   }
// }
