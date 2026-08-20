// This file is used to create custom exceptions for the application
// Each exception is a class that implements the Exception interface
// And there is an exception for each type of Failure

class OfflineException implements Exception {}

class ServerException implements Exception {}

class CacheException implements Exception {}
