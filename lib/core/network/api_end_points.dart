// EndPoints: the endpoints of the api
abstract class EndPoint {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const String posts = "posts/";
}

// ApiKeys: the keys of the api
abstract class ApiKey {
  static const String statusCode = "statusCode";
  static const String errorMessage = "message";
}
