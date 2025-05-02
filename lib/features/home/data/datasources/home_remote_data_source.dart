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
       return ProductsModel.fromJson(kresponse);
    // var response = await getIt<ApiClient>().get(
    //   Uri.parse("${api.baseUrl}${api.getProducts}"),
    // );

    // if (response.statusCode == 200) {
    //   var data = await compute(jsonDecode, response.body);

    //   return ProductsModel.fromJson(data);
    // } else {
    //   throw ServerException(
    //     message: jsonDecode(response.body)['message'] ?? kunknownError,
    //   );
    // }
  }
}
var kresponse={
    "data": [
        {
            "id": "1",
            "name": "iPhone 16 Pro",
            "createdAt": "2025-04-25T02:25:08.403Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-3.jpg"
            ],
            "specifications": {
                "RAM": "8GB",
                "storage": "256GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP + 12MP",
                "display": "6.7-inch Super Retina XDR"
            },
            "description": "The latest iPhone 16 Pro with cutting-edge technology and powerful performance.",
            "price": "\$1199"
        },
        {
            "id": "24",
            "name": "iPhone 14",
            "createdAt": "2025-04-25T02:30:15.203Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-3.jpg"
            ],
            "specifications": {
                "RAM": "6GB",
                "storage": "128GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP",
                "display": "6.1-inch Super Retina XDR"
            },
            "description": "Experience next-gen technology with the iPhone 16.",
            "price": "\$399"
        },
         {
            "id": "122",
            "name": "iPhone 16 Pro",
            "createdAt": "2025-04-25T02:25:08.403Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-3.jpg"
            ],
            "specifications": {
                "RAM": "8GB",
                "storage": "256GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP + 12MP",
                "display": "6.7-inch Super Retina XDR"
            },
            "description": "The latest iPhone 16 Pro with cutting-edge technology and powerful performance.",
            "price": "\$199"
        },
        {
            "id": "222",
            "name": "iPhone 16",
            "createdAt": "2025-04-25T02:30:15.203Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-3.jpg"
            ],
            "specifications": {
                "RAM": "6GB",
                "storage": "128GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP",
                "display": "6.1-inch Super Retina XDR"
            },
            "description": "Experience next-gen technology with the iPhone 16.",
            "price": "\$299"
        },
        {
            "id": "2",
            "name": "iPhone 16",
            "createdAt": "2025-04-25T02:30:15.203Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-3.jpg"
            ],
            "specifications": {
                "RAM": "6GB",
                "storage": "128GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP",
                "display": "6.1-inch Super Retina XDR"
            },
            "description": "Experience next-gen technology with the iPhone 16.",
            "price": "\$999"
        },
        {
            "id": "3",
            "name": "iPhone 17 Pro",
            "createdAt": "2025-04-30T10:15:00.000Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-17-pro-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-17-pro-2.jpg"
            ],
            "specifications": {
                "RAM": "12GB",
                "storage": "512GB",
                "chip": "A19 Pro",
                "camera": "48MP + 24MP + 12MP",
                "display": "6.7-inch LTPO OLED"
            },
            "description": "The iPhone 17 Pro with a new titanium-aluminum hybrid design and enhanced AI features.",
            "price": "\$1299"
        },
        {
            "id": "4",
            "name": "iPhone 17 Air",
            "createdAt": "2025-04-30T10:20:00.000Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-17-air-1.jpg"
            ],
            "specifications": {
                "RAM": "8GB",
                "storage": "256GB",
                "chip": "A19",
                "camera": "48MP + 12MP",
                "display": "6.6-inch LTPO OLED"
            },
            "description": "Apple's thinnest iPhone yet, the iPhone 17 Air, designed for elegance and portability.",
            "price": "\$999"
        },
        {
            "id": "5",
            "name": "iPhone Fold",
            "createdAt": "2025-04-30T10:30:00.000Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-fold-1.jpg"
            ],
            "specifications": {
                "RAM": "12GB",
                "storage": "512GB",
                "chip": "A19 Ultra",
                "camera": "48MP + 24MP + 12MP",
                "display": "7.8-inch foldable OLED"
            },
            "description": "Apple's first foldable iPhone, featuring a book-style design and premium materials.",
            "price": "\$1999"
        },
         {
            "id": "14",
            "name": "iPhone 16 Pro",
            "createdAt": "2025-04-25T02:25:08.403Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-3.jpg"
            ],
            "specifications": {
                "RAM": "8GB",
                "storage": "256GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP + 12MP",
                "display": "6.7-inch Super Retina XDR"
            },
            "description": "The latest iPhone 16 Pro with cutting-edge technology and powerful performance.",
            "price": "\$2199"
        },
        {
            "id": "24",
            "name": "iPhone 14",
            "createdAt": "2025-04-25T02:30:15.203Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-3.jpg"
            ],
            "specifications": {
                "RAM": "6GB",
                "storage": "128GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP",
                "display": "6.1-inch Super Retina XDR"
            },
            "description": "Experience next-gen technology with the iPhone 16.",
            "price": "\$399"
        },
         {
            "id": "12",
            "name": "iPhone 16 Pro",
            "createdAt": "2025-04-25T02:25:08.403Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-pro-3.jpg"
            ],
            "specifications": {
                "RAM": "8GB",
                "storage": "256GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP + 12MP",
                "display": "6.7-inch Super Retina XDR"
            },
            "description": "The latest iPhone 16 Pro with cutting-edge technology and powerful performance.",
            "price": "\$1199"
        },
        {
            "id": "22",
            "name": "iPhone 16",
            "createdAt": "2025-04-25T02:30:15.203Z",
            "imageCarousel": [
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-1.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-2.jpg",
                "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-16-3.jpg"
            ],
            "specifications": {
                "RAM": "6GB",
                "storage": "128GB",
                "chip": "A18 Bionic",
                "camera": "48MP + 12MP",
                "display": "6.1-inch Super Retina XDR"
            },
            "description": "Experience next-gen technology with the iPhone 16.",
            "price": "\$99"
        },
    ]
};
