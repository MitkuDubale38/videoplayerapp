import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:videoplayerapp/app/core/http_client/http_service.dart';
import 'package:videoplayerapp/app/core/http_exeption_handler/http_exception_handler.dart';
import 'package:videoplayerapp/app/data/videos/models/videos.dart';
import 'package:videoplayerapp/app/modules/home/controllers/video_http_attribuites.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    fetchVideos();
    super.onInit();
  }

  Video? video;
  RxBool isLoading = false.obs;
  Future<Video?> fetchVideos() async {
    isLoading.value = true;
    var httpService = Get.find<HttpService>();
    dynamic response =
        await httpService.sendHttpRequest(VideosHttpAttributes());
    try {
      final result = jsonDecode(response!.body);
      video  = Video.fromJson(result);
      isLoading.value = false;
      return video;
    } on HttpException catch (ex) {
      HttpException(HandleHttpException().handleHttpResponse(ex));
      isLoading.value = false;
    } catch (ex) {
      Get.snackbar(
        'Error',
        "Failed to parse videos",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
    }
    return null;
  }
}
