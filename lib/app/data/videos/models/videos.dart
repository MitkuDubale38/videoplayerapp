import 'dart:convert';

import 'package:videoplayerapp/app/data/videos/models/video_element.dart';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
    String appBackgroundHexColor;
    List<VideoElement> videos;

    Video({
        required this.appBackgroundHexColor,
        required this.videos,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        appBackgroundHexColor: json["appBackgroundHexColor"],
        videos: List<VideoElement>.from(json["videos"].map((x) => VideoElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "appBackgroundHexColor": appBackgroundHexColor,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    };
}


