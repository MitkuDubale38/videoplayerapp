import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:videoplayerapp/app/core/core_dependency.dart';

import 'app/routes/app_pages.dart';

void main() {
  CoreDependencyCreator.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
