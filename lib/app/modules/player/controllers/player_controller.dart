import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayerapp/app/utils/helper/ad_manager.dart';

class PlayerController extends GetxController {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  String videoUrl = "";
  VideoPlayerController get controller => _controller;
  InterstitialAdManager _interstitialAdManager = InterstitialAdManager();

  @override
  void onInit() {
    super.onInit();
    //
    _interstitialAdManager.loadInterstitialAd();
    // Load the interstitial ad when the video player starts
    _interstitialAdManager.showInterstitialAd();
    
    _initializeVideoPlayer().then((_) {
      update();
    });
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://app.et/devtest/videos/video1.mp4"),
    );
    // await _controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      fullScreenByDefault: true,
    );
  }

  @override
  void onClose() {
    _controller.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
