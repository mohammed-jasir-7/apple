import 'dart:io';
import 'package:apple/core/errors/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:dartz/dartz.dart';
abstract class PathStorage {
  /// Retrieves the temporary directory.
  Future<Either<Failure, Directory>> getTemporaryDirectory();

  /// Retrieves the application documents directory.
  Future<Either<Failure, Directory>> getApplicationDocumentsDirectory();

  /// Retrieves the downloads directory.
  Future<Either<Failure, Directory?>> getDownloadsDirectory();
}



@Injectable(as: PathStorage)
class PathStorageImpl implements PathStorage {
  @override
  Future<Either<Failure, Directory>> getTemporaryDirectory() async {
    try {
      final directory = await path_provider.getTemporaryDirectory();
      return Right(directory);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to get temporary directory"));
    }
  }

  @override
  Future<Either<Failure, Directory>> getApplicationDocumentsDirectory() async {
    try {
      final directory = await path_provider.getApplicationDocumentsDirectory();
      return Right(directory);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to get application documents directory"));
    }
  }

  @override
  Future<Either<Failure, Directory?>> getDownloadsDirectory() async {
    try {
      final directory = await  path_provider.getExternalStorageDirectory();
      return Right(directory);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to get downloads directory"));
    }
  }
}
