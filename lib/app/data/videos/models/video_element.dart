class VideoElement {
    String videoTitle;
    String videoThumbnail;
    String videoUrl;
    String? videoDescription;

    VideoElement({
        required this.videoTitle,
        required this.videoThumbnail,
        required this.videoUrl,
        this.videoDescription,
    });

    factory VideoElement.fromJson(Map<String, dynamic> json) => VideoElement(
        videoTitle: json["videoTitle"],
        videoThumbnail: json["videoThumbnail"],
        videoUrl: json["videoUrl"],
        videoDescription: json["videoDescription"],
    );

    Map<String, dynamic> toJson() => {
        "videoTitle": videoTitle,
        "videoThumbnail": videoThumbnail,
        "videoUrl": videoUrl,
        "videoDescription": videoDescription,
    };
}