import 'package:videoplayerapp/app/core/http_client/htttp_attrib_options.dart';
import 'package:videoplayerapp/app/utils/keys.dart';

class VideosHttpAttributes extends HttpClientAttributeOptions {
  VideosHttpAttributes()
      : super(
          baseUrl: Keys.baseurl,
          url: "/list.json",
          connectionTimeout: 30,
          contentType: 'application/json',
          method: HttpMethod.GET,
          retries: 2,
          isAuthorizationRequired: false,
        );
}