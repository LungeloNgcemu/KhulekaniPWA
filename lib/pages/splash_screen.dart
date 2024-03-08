import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:khulekani_app/world_view.dart';
import 'package:khulekani_app/view.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FlutterSplashScreen.scale(
      //   gradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Colors.lightBlue,
      //       Colors.blue,
      //     ],
      //   ),
      //   childWidget: SizedBox(
      //     height: 50,
      //     child: Image.asset("images/logo.png"),
      //   ),
      //   duration: const Duration(milliseconds: 10500),
      //   animationDuration: const Duration(milliseconds: 14000),
      //   onAnimationEnd: () => debugPrint("On Scale End"),
      //   nextScreen: const WorldView()
      // ),






     body:  FlutterSplashScreen.fadeIn(
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.white,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Hero(
            tag: "love",
              child: Image.asset("images/logo.png")),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: WorldView(),
      ),
    );
  }
}
