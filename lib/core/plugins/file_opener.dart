import 'package:open_file/open_file.dart';
import 'package:dartz/dartz.dart' hide OpenFile;
import 'package:apple/core/errors/failure.dart';

import 'package:injectable/injectable.dart';

abstract class FileOpener {
  /// Opens a file from the given path
  Future<Either<Failure, void>> openFile(String filePath);

  /// Opens a PDF file
  Future<Either<Failure, void>> openPDF(String filePath);

  /// Opens a file with a custom type
  Future<Either<Failure, void>> openWithType(String filePath, String fileType);
}



@Injectable(as: FileOpener)
class FileOpenerImpl implements FileOpener {
  @override
  Future<Either<Failure, void>> openFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type == ResultType.done) {
        return const Right(null);
      } else {
        return Left(LocalStorageFailure(errorMessage: result.message));
      }
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to open file"));
    }
  }

  @override
  Future<Either<Failure, void>> openPDF(String filePath) async {
    return openWithType(filePath, "application/pdf");
  }

  @override
  Future<Either<Failure, void>> openWithType(String filePath, String fileType) async {
    try {
      final result = await OpenFile.open(filePath, type: fileType);
      if (result.type == ResultType.done) {
        return const Right(null);
      } else {
        return Left(LocalStorageFailure(errorMessage: result.message));
      }
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to open file with type $fileType"));
    }
  }
}
