import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:videoplayerapp/app/core/http_client/htttp_attrib_options.dart';

class ProcessHttpRequest {
  Future<http.Response> processGetRequest(RetryClient httpClient,
      HttpClientAttributeOptions httpAttribOptions) async {
    Uri uri = Uri.parse( httpAttribOptions.baseUrl + httpAttribOptions.url);
    return await httpClient
        .get(
          uri,
          headers: httpAttribOptions.headers,
        )
        .timeout(
          Duration(seconds: httpAttribOptions.connectionTimeout),
        );
  }

}