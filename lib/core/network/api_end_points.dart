// EndPoints: the endpoints of the api
abstract class EndPoint {
  static const String baseUrl = "https://dummyjson.com/";
  static const String posts = "posts";
  static const String addPost = "posts/add";
}

// ApiKeys: the keys of the api
abstract class ApiKey {
  static const String statusCode = "statusCode";
  static const String errorMessage = "message";
}
