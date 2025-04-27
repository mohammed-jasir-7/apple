import 'package:apple/core/connection/network_info.dart';
import 'package:apple/core/constants/constants.dart';
import 'package:apple/core/errors/exceptions.dart';
import 'package:apple/core/errors/failure.dart';
import 'package:apple/features/home/data/datasources/home_remote_data_source.dart';
import 'package:apple/features/home/data/models/products_model.dart';
import 'package:apple/features/home/domain/repositories/home_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,

    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductsModel>> getProducts() async {
    if (await networkInfo.isConnected!) {
      try {
        ProductsModel remoteHome = await remoteDataSource.getProducts();

        return Right(remoteHome);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return Left(NetworkFailure(errorMessage: kNoInternetConnection));
    }
  }
}
