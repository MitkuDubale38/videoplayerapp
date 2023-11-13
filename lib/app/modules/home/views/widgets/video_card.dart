
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:videoplayerapp/app/data/videos/models/video_element.dart';
import 'package:videoplayerapp/app/modules/home/views/widgets/shimmer_image_place_holder.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.video,
  });

  final VideoElement? video;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).cardColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      borderOnForeground: true,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.015),
        child: ListTile(
          leading: SizedBox(
            width: 30.w,
            height: 10.h,
            child: CachedNetworkImage(
              imageUrl: video?.videoThumbnail ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTFlhSWwrzGBZnqDlW7uLEEJWBhFc8sW_Ruw&usqp=CAU",
              placeholder: (context, url) =>
                 shimmerPlaceholder ,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
            ),
          ),
          title: Text(
            video?.videoTitle ?? "",
            style: const TextStyle(fontFamily: "Lato"),
          ),
          subtitle: Text(
            video?.videoDescription ?? "",
            style: const TextStyle(fontFamily: "Lato"),
          ),
          onTap: () {
             Get.toNamed('/player', arguments: {'video': video});
          },
        ),
      ),
    );
  }
}
