import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayerapp/app/modules/home/controllers/home_controller.dart';

class PlayerController extends GetxController {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  String videoUrl;
  PlayerController(this.videoUrl);
  VideoPlayerController get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    //showing AD
    interstitialAdManager.showInterstitialAd();
    //initializing video player
    _initializeVideoPlayer().then((_) {
      update();
    });
  }

  //initializing video player
  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );
    chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      fullScreenByDefault: true,
      overlay: IconButton(
        onPressed: () {
          _controller.pause();
          _controller.dispose();
          Get.offAndToNamed("/home");
        },
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
    );
  }

  void setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void onClose() {
    _controller.dispose();
    chewieController.dispose();
    setPortraitMode();
    super.onClose();
  }
}
