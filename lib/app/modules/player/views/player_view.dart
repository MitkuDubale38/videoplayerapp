import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayerapp/app/data/videos/models/video_element.dart';
import '../controllers/player_controller.dart';

// ignore: must_be_immutable
class PlayerView extends GetView<PlayerController> {
  PlayerView({Key? key}) : super(key: key);
  Map<String, dynamic> arguments = Get.arguments;
   
    

  @override
  Widget build(BuildContext context) {
    //setting video url
    VideoElement video = arguments['video'];
    controller.videoUrl = video.videoUrl;
   
    return Scaffold(
      body: Stack(
        children: [
          Chewie(
            controller: controller.chewieController,
          ),
          Positioned(
            top: 5,
            left: 10,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
