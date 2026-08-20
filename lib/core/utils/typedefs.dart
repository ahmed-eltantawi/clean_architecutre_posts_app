// This file is used to create custom typedefs for the application
import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

/// this in case we need to return Future<Either<Failure, T>>
typedef FutureEither<T> = Future<Either<Failure, T>>;
