import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:videoplayerapp/app/core/cache/local_storage.dart';
import 'package:videoplayerapp/app/core/http_client/http_service.dart';
import 'package:videoplayerapp/app/core/http_exeption_handler/http_exception_handler.dart';
import 'package:videoplayerapp/app/data/videos/models/videos.dart';
import 'package:videoplayerapp/app/modules/home/controllers/video_http_attribuites.dart';
import 'package:videoplayerapp/app/utils/helper/ad_manager.dart';
import 'package:videoplayerapp/app/utils/helper/connectivity_status.dart';
import 'package:videoplayerapp/app/utils/helper/hex_color_helper.dart';
import 'package:videoplayerapp/app/utils/keys.dart';

InterstitialAdManager interstitialAdManager = InterstitialAdManager();
class HomeController extends GetxController {
  Video? video;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  Color? bgColor;
  CacheStorageService cacheStorageService = CacheStorageService();

  @override
  void onInit() async {
    final internetConnectivity = InternetConnectivity();
    if (internetConnectivity.isConnected) {
      //pre loading AD
      interstitialAdManager.loadAd();
      fetchVideos();
    } else {
      fetchVideosFromCache();
    }
    super.onInit();
  }

  //featching videos from API
  Future<void> fetchVideos() async {
    isLoading.value = true;
    var httpService = Get.find<HttpService>();
    dynamic response =
        await httpService.sendHttpRequest(VideosHttpAttributes());
    try {
      final result = jsonDecode(response!.body);
      video = Video.fromJson(result);
      bgColor = HexColor(video!.appBackgroundHexColor);

      //caching the data
      cacheStorageService.saveData(Keys.videoCacheKey, result);
      isLoading.value = false;
      isError.value = false;
    } on HttpException catch (ex) {
      HttpException(HandleHttpException().handleHttpResponse(ex));
      isLoading.value = false;
      isError.value = true;
    } catch (ex) {
      Get.snackbar(
        'Error',
        "Failed to parse videos",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      isError.value = true;
    }
  }

  //featching videos from Local Storage(Cache)
  Future<void> fetchVideosFromCache() async {
    isLoading.value = true;
    try {
      dynamic cachedData =
          await cacheStorageService.getSavedData(Keys.videoCacheKey);
      if (cachedData != null) {
        video = Video.fromJson(cachedData);
        bgColor = HexColor(video!.appBackgroundHexColor);
      } else {
        isError.value = true;
      }
      isLoading.value = false;
    } catch (ex) {
      Get.snackbar(
        'Error',
        "Failed to load videos",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      isError.value = true;
    }
  }
}
