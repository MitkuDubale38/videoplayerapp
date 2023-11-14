import 'package:get/get.dart';
import 'package:videoplayerapp/app/data/videos/models/video_element.dart';

import '../controllers/player_controller.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Map<String, dynamic> arguments = Get.arguments;
    VideoElement video = arguments['video'];
    Get.lazyPut<PlayerController>(
      () => PlayerController(video.videoUrl),
    );
  }
}
