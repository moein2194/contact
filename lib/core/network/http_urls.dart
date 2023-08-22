class HttpUrls {
  static String baseUrl = "https://contacts-df29.restdb.io/rest";
}

class UrlPathKey {
  static const String contacts = "/contacts";
  static String contactByID(String id) => "$contacts/$id";
}
