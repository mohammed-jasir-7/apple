import 'package:apple/core/errors/failure.dart';
import 'package:apple/features/home/domain/entities/products_entity.dart';

import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  ///this function used to get products
  ///
  ///Returns [Right] containing a [ProductsEntity] if the products were fetched successfully, or
  /// [Left] containing a [Failure] if the fetch failed.
  Future<Either<Failure, ProductsEntity>> getProducts();
}
