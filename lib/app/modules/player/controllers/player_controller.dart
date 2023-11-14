import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayerapp/app/utils/helper/ad_manager.dart';

class PlayerController extends GetxController {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  String videoUrl;
  PlayerController(this.videoUrl);
  VideoPlayerController get controller => _controller;
  InterstitialAdManager interstitialAdManager = InterstitialAdManager();

  @override
  void onInit() {
    super.onInit();
     //loading AD
    interstitialAdManager.loadAd();

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
      autoPlay: false,
      looping: true,
      allowFullScreen: true,
      fullScreenByDefault: true,

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
