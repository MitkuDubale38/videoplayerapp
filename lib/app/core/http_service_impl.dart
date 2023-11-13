import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:videoplayerapp/app/core/http_exeption_handler/http_exception_handler.dart';
import 'package:videoplayerapp/app/core/http_service.dart';
import 'package:videoplayerapp/app/core/http_ststus_code_worth_retrying.dart';
import 'package:videoplayerapp/app/core/htttp_attrib_options.dart';
import 'package:videoplayerapp/app/core/process_http_request.dart';

class HttpServiceImpl implements HttpService {
  @override
  Future<dynamic> sendHttpRequest(
      HttpClientAttributeOptions httpAttribOptions) async {
    try {
      // instantiating  http client class
      final httpClient =
          RetryClient(http.Client(), retries: httpAttribOptions.retries,
              when: (http.BaseResponse response) {
        return HttpStatusWorthRetying.isWorthRetrying(response.statusCode);
      });

      //instantiating response object
      http.Response? response;

       //instantiating http processor class
      ProcessHttpRequest processHttpRequest = ProcessHttpRequest();
      
      switch (httpAttribOptions.method) {
        case HttpMethod.GET:
          response = await processHttpRequest.processGetRequest(
              httpClient, httpAttribOptions);
          if (response.statusCode == 200) {
            return response;
          } else if (response.statusCode == 401 || response.statusCode == 403) {
            //refresh access token and retry the request  again
          }
          break;
        default:
          break;
      }
    } on Exception catch (e) {
      String message = HandleHttpException().handleHttpResponse(e);
      
      
    }
    return null;
  }
}