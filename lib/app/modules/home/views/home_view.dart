import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: controller.video?.videos.length,
              itemBuilder: (context, index) {
                final video = controller.video?.videos[index];
                return ListTile(
                  leading: Image.network(video?.videoThumbnail ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTFlhSWwrzGBZnqDlW7uLEEJWBhFc8sW_Ruw&usqp=CAU"),
                  title: Text(video!.videoTitle),
                  subtitle: Text(video.videoDescription ?? ""),
                  onTap: () {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
