import 'package:share_plus/share_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:apple/core/errors/failure.dart';


import 'package:injectable/injectable.dart';

/// Abstract class for sharing content
abstract class ShareService {
  /// Shares text content
  Future<Either<Failure, void>> shareText(String text);

  /// Shares a file
  Future<Either<Failure, void>> shareFile(String filePath);

  /// Shares multiple files
  Future<Either<Failure, void>> shareMultipleFiles(List<String> filePaths);
}



@Injectable(as: ShareService)
class ShareServiceImpl implements ShareService {
  @override
  Future<Either<Failure, void>> shareText(String text) async {
    try {
      await SharePlus.instance.share(ShareParams(text: text));
      return const Right(null);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to share text"));
    }
  }

  @override
  Future<Either<Failure, void>> shareFile(String filePath) async {
    try {
      final file = XFile(filePath);
      await SharePlus.instance.share(ShareParams(files: [file]));
      return const Right(null);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to share file"));
    }
  }

  @override
  Future<Either<Failure, void>> shareMultipleFiles(List<String> filePaths) async {
    try {
      final files = filePaths.map((path) => XFile(path)).toList();
      await SharePlus.instance.share(ShareParams(files: files));
      return const Right(null);
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "Failed to share multiple files"));
    }
  }
}
