

import 'package:apple/core/connection/network_info.dart';
import 'package:apple/core/errors/exceptions.dart';
import 'package:apple/core/errors/failure.dart';
import 'package:apple/core/params/params.dart';
import 'package:apple/features/template/data/datasources/template_local_data_source.dart';
import 'package:apple/features/template/data/datasources/template_remote_data_source.dart';
import 'package:apple/features/template/data/models/template_model.dart';
import 'package:apple/features/template/domain/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TemplateModel>> getTemplate(
      {required TemplateParams templateParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        TemplateModel remoteTemplate =
            await remoteDataSource.getTemplate(templateParams: templateParams);

        localDataSource.cacheTemplate(templateToCache: remoteTemplate);

        return Right(remoteTemplate);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        TemplateModel localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on Exception {
        return Left(LocalStorageFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
