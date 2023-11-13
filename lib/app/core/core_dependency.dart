
import 'package:get/get.dart';
import 'package:videoplayerapp/app/core/http_client/http_service.dart';
import 'package:videoplayerapp/app/core/http_client/http_service_impl.dart';

class CoreDependencyCreator {
  static init() {
    Get.put<HttpService>(HttpServiceImpl());
  }
}