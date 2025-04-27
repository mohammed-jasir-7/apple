import 'package:apple/core/errors/failure.dart';
import 'package:apple/features/authentication/domain/repositories/authentication_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@injectable
class GoogleSignIn {
  final AuthenticationRepository authenticationRepository;
/// Constructor for the [GoogleSignIn] class.
/// 
/// This class is responsible for calling the [AuthenticationRepository.googleSignIn] method.
/// callable method returns a [Future] that resolves to either a [Failure] or a [User].
  GoogleSignIn({required this.authenticationRepository});

  /// Calls [AuthenticationRepository.googleSignIn] and returns the result.
  ///
  /// Returns [Right] containing a [User] if the sign in was successful, or
  /// [Left] containing a [Failure] if the sign in failed.
  Future<Either<Failure, User?>> call() async {
    return await authenticationRepository.googleSignIn();
  }
}
