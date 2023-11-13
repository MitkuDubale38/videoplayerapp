import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayerapp/app/data/videos/models/video_element.dart';
import '../controllers/player_controller.dart';

// ignore: must_be_immutable
class PlayerView extends GetView<PlayerController> {
  PlayerView({Key? key}) : super(key: key);
  Map<String, dynamic> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    //settting aspect ratio
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;

    //setting video url
    VideoElement video = arguments['video'];
    controller.videoUrl = video.videoUrl;

    //setting orientiation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Chewie(
              controller: controller.chewieController,
            );
          } else {
            return const Center(
              child: Text('Please rotate your device to landscape mode'),
            );
          }
        },
      ),
    );
  }
}
  // AspectRatio(
  //                 aspectRatio: aspectRatio,
  //                 child: VideoPlayer(controller.controller),
  //               ),