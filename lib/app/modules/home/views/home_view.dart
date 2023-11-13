import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayerapp/app/modules/home/views/widgets/video_card.dart';
import 'package:videoplayerapp/app/utils/colors.dart';
import 'package:videoplayerapp/app/utils/shared_widgets/error_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isLoading.value == true ||
                controller.isError.value == true
            ? Colors.white
            : controller.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: GlobalColors.appBarColor,
          title: const Text('Vamos Videos'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.star_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
        ),
        body: controller.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.isError.value == true
                ? CustomErrorWidget(
                    errorMessage: "Unable to load videos",
                    onRefresh: () {
                      return controller.fetchVideos();
                    },
                  )
                : RefreshIndicator(
                    onRefresh: () {
                      return controller.fetchVideos();
                    },
                    child: OrientationBuilder(
                      builder: (context, orientation) {
                        if (orientation == Orientation.portrait) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.video?.videos.length,
                            itemBuilder: (context, index) {
                              final video = controller.video?.videos[index];
                              return VideoCard(video: video);
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
      ),
    );
  }
}
