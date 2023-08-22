import 'package:contact/core/network/http_request_handler.dart';
import 'package:contact/core/network/http_urls.dart';

class HomeApiProvider {
  Future<(Map<String, dynamic>?,String?)> getContactsList<T>() {
    return HttpRequestHanlder.get(UrlPathKey.contacts);
  }
}
