import 'package:apple/core/errors/failure.dart';
import 'package:apple/features/home/domain/entities/products_entity.dart';
import 'package:apple/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProducts {
  final HomeRepository homeRepository;

  GetProducts({required this.homeRepository});

  Future<Either<Failure, ProductsEntity>> call() async {
    return await homeRepository.getProducts();
  }
}
