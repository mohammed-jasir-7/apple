import 'dart:convert';

import 'package:apple/core/api/api.dart';
import 'package:apple/core/api/api_client.dart';
import 'package:apple/core/constants/constants.dart';
import 'package:apple/core/errors/exceptions.dart';
import 'package:apple/features/home/data/models/products_model.dart';
import 'package:apple/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';



abstract class HomeRemoteDataSource {
  Future<ProductsModel> getProducts();
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Endpoints api;

  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<ProductsModel> getProducts() async {
    var response = await getIt<ApiClient>().get(
      Uri.parse("${api.baseUrl}${api.getProducts}"),
    );

    if (response.statusCode == 200) {
      var data = await compute(jsonDecode, response.body);

      return ProductsModel.fromJson(data);
    } else {
      throw ServerException(
        message: jsonDecode(response.body)['message'] ?? kunknownError,
      );
    }
  }
}
