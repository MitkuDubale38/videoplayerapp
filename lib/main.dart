import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:videoplayerapp/app/core/core_dependency.dart';
import 'package:videoplayerapp/app/utils/helper/connectivity_status.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  final internetConnectivity = InternetConnectivity();
  await internetConnectivity.initialize();
  await Hive.initFlutter();
  await Hive.openBox('video_cache'); 
  CoreDependencyCreator.init();
  
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Vamos Video",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
