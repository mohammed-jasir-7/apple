import 'package:apple/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  ///this function used to get authentication
  Future<Either<Failure, User?>> googleSignIn();
}
