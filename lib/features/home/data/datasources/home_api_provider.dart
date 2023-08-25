import 'package:contact/core/network/http_request_handler.dart';
import 'package:contact/core/network/http_urls.dart';

class HomeApiProvider {
  Future<(dynamic result,String?)> getContactsList<T>() {
    
    return HttpRequestHanlder.get(UrlPathKey.contacts);
  }
}
