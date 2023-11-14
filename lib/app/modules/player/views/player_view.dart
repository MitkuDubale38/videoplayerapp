import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/player_controller.dart';

// ignore: must_be_immutable
class PlayerView extends GetView<PlayerController> {
  const PlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // Set the preferred orientation to landscape
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);

        return Scaffold(
          body: Stack(
            children: [
              Chewie(
                controller: controller.chewieController,
              ),
              // Positioned(
              //   top: 5,
              //   left: 10,
              //   child: IconButton(
              //     onPressed: () {
              //       Get.back();
              //       controller.setPortraitMode();
              //     },
              //     icon: Icon(
              //       Icons.chevron_left_rounded,
              //       color: Colors.white,
              //       size: 30.sp,
              //     ),
              //   ),
              // )
            ],
          ),
        );
      }
    );
  }
}
