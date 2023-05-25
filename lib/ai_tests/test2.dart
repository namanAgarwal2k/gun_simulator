// //In this spark visibility issue and recoil is random
// import 'dart:math';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:shake/shake.dart';
//
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const GunSimulatorApp(),
//     );
//   }
// }
//
// class GunSimulatorApp extends StatefulWidget {
//   const GunSimulatorApp({super.key});
//
//   @override
//   _GunSimulatorAppState createState() => _GunSimulatorAppState();
// }
//
// class _GunSimulatorAppState extends State<GunSimulatorApp> {
//   late ShakeDetector detector;
//   bool _isFiring = false;
//   bool _isShaking = false;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   // final assetsAudioPlayer = AssetsAudioPlayer();
//   final Random random = Random();
//   double _rotation = 0.0;
//   double _bulletSparkX = 0.0;
//   double _bulletSparkY = 0.0;
//   double _gunRecoilY = 0.0;
//
//   void _fireGun() {
//     if (!_isFiring) {
//       setState(() {
//         _isFiring = true;
//         _isShaking = true;
//         _gunRecoilY = 10.0;
//         _rotation = random.nextDouble() * pi / 6 - pi / 12;
//         _bulletSparkX = random.nextDouble() * 200 - 100;
//         _bulletSparkY = random.nextDouble() * 200 - 100;
//       });
//       _audioPlayer.play(AssetSource('sounds/pistol.mp3'));
//       // assetsAudioPlayer.open(Audio('assets/gun_shot.mp3'));
//       Future.delayed(const Duration(milliseconds: 500)).then((value) {
//         setState(() {
//           _isFiring = false;
//           _isShaking = false;
//           _gunRecoilY = 0.0;
//         });
//       });
//     }
//   }
//
//   Widget _buildGun() {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeOutQuad,
//       transform: Matrix4.rotationZ(_rotation),
//       child: Image.asset(
//         'assets/guns/classicPistol.png',
//         height: 200.0,
//       ),
//       onEnd: () {
//         if (!_isFiring) {
//           setState(() {
//             _rotation = 0.0;
//           });
//         }
//       },
//     );
//   }
//
//   Widget _buildBulletSpark(double width, double height) {
//     return AnimatedPositioned(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeOutQuad,
//       left: MediaQuery.of(context).size.width / 2 + _bulletSparkX,
//       top: MediaQuery.of(context).size.height / 2 - 100 + _bulletSparkY,
//       child: Image.asset(
//         'assets/guns/sparkNew.png',
//         height: 50.0,
//       ),
//       onEnd: () {
//         if (!_isFiring) {
//           setState(() {
//             _bulletSparkX = 0.0;
//             _bulletSparkY = 0.0;
//           });
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Gun Simulator'),
//         ),
//         body: GestureDetector(
//           onTap: _fireGun,
//           child: Stack(children: [
//             Container(
//               color: Colors.grey[300],
//             ),
//             _buildBulletSpark(width, height),
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeOutQuad,
//               transform: Matrix4.translationValues(
//                   0.0, _isShaking ? _gunRecoilY : 0.0, 0.0),
//               child: _buildGun(),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
