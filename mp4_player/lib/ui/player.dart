import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'controls_overlay.dart';

class Player extends StatelessWidget {

  final VideoPlayerController videoPlayerController;
  final double playerAspectRatio;
  const Player({Key? key ,required this.playerAspectRatio , required this.videoPlayerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: playerAspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(videoPlayerController),
            ControlsOverlay(controller: videoPlayerController),
            VideoProgressIndicator(videoPlayerController, allowScrubbing: true),
          ],
        ),
      ),
    );
  }
}
