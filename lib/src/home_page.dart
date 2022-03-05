import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late AudioPlayer player;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.stop();
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await player.setAsset("assets/tini.mp3");
            if (animationController.isAnimating) {
              animationController.stop();
              player.stop();
            } else {
              animationController.repeat();
              player.play();
            }
          },
          child: RotationTransition(
              alignment: Alignment.center,
              turns: animationController,
              child: Image(image: AssetImage("assets/tinii.png"))),
        ),
      ),
    );
  }
}

