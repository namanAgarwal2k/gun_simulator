//code of motion ball

//   double posX = 180, posY = 250;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(widget.title),
//       ),
//       body:
//       StreamBuilder<GyroscopeEvent>(
//           stream: SensorsPlatform.instance.gyroscopeEvents,
//           builder: (context, snapshot) {
//             // print("");
//             if (snapshot.hasData) {
//               if(snapshot.data!.y*10!= posY || snapshot.data!.x*10 != posX) {
//                 // playSound();
//
//                 posX = posX + (snapshot.data!.y*10);
//                 posY = posY + (snapshot.data!.x*10);
//               }
//               else{
//                 playSound();
//               }
//             }
//             return Transform.translate(
//               offset: Offset(posX, posY),
//               child: const CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }),
//     );
//   }
// }

// late AnimationController _imageAnimationController;
// @override
// void initState() {
//   _imageAnimationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 8));
//
//   _animationController = AnimationController(vsync: this,
//       duration: const Duration());
//
//   ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
//     playSound();
//   });
//   super.initState();
// }
//  Center(
//  //  child: ScaleTransition(
//    //  scale: _animationController,
//      child: Form(
//        key: formKey,
//        child: Column(
//          children: [
//            Padding(
//              padding: const EdgeInsets.all(28.0),
//              child: OffsetAnimation(
//                animationController: _imageAnimationController,
//                  end:46,
//                  widget:
//                  TextFormField(
//                    decoration: const InputDecoration(label: Text('dc')),
//                    validator: (value){
//                    if(value!.isEmpty){
//                      _imageAnimationController.forward();
//                      return "Please enter";
//                    }
//                    return null;
//                    },
//                  ),
//                  // InkWell(
//                  //   onTap: (){
//                  //     print('hhh');
//                  //     _imageAnimationController.forward();
//                  //   },
//                  //     child:  const Image(image: AssetImage('assets/guns/gun_1.png'),
//                  //
//                  //     )//Image.asset('assets/guns/pistol.jpg'),
//                  // ),
//
//              ),
//            ),
//           //  ElevatedButton(onPressed:(){
//           //    formKey.currentState!.validate();
//           //  }
//           // , child: Text('log'),),
//          ],
//        ),
//      ),
//
//    //),
//    // child: IconButton(onPressed: ()
//    //    {
//    //   // playSound();
//    //
//    // }, icon: const Icon(Icons.gamepad),
//
// //   ),
//  )
//  );
//  }
//  @override
//  void dispose() {
//    _animationController.dispose();
//    _imageAnimationController.dispose();
//    super.dispose();
//  }
