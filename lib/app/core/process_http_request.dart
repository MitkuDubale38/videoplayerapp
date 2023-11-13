import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:videoplayerapp/app/core/htttp_attrib_options.dart';

class ProcessHttpRequest {
  Future<http.Response> processGetRequest(RetryClient httpClient,
      HttpClientAttributeOptions httpAttribOptions) async {
    return await httpClient
        .get(
          Uri.https(
            httpAttribOptions.baseUrl,
            httpAttribOptions.url,
            httpAttribOptions.param,
          ),
          headers: httpAttribOptions.headers,
        )
        .timeout(
          Duration(seconds: httpAttribOptions.connectionTimeout),
        );
  }

}