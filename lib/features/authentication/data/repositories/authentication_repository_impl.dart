import 'package:apple/core/connection/network_info.dart';
import 'package:apple/core/constants/constants.dart';
import 'package:apple/core/errors/exceptions.dart';
import 'package:apple/core/errors/failure.dart';
import 'package:apple/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:apple/features/authentication/domain/repositories/authentication_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final SocialLogins socialLogins;

  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl({
    required this.socialLogins,

    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User?>> googleSignIn() async {
    if (await networkInfo.isConnected!) {
      try {
        var result = await socialLogins.googleSignIn();

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(NetworkFailure(errorMessage: kNoInternetConnection));
    }
  }
}
