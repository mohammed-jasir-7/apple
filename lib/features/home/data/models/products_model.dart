import 'package:apple/features/home/domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({super.data});

  factory ProductsModel.fromJson(Map<String, dynamic>? json) {
    return ProductsModel(
      data:
          (json?['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => (e as Data?)?.toJson()).toList(),
  };
}

class Data extends DataEntity {
  Data({
    super.id,
    super.name,
    super.createdAt,
    super.imageCarousel,
    super.specifications,
    super.description,
    super.price,
  });

  factory Data.fromJson(Map<String, dynamic>? json) {
    return Data(
      id: json?['id'] as String?,
      name: json?['name'] as String?,
      createdAt: json?['createdAt'] as String?,
      imageCarousel:
          (json?['imageCarousel'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      specifications:
          (json?['specifications'] as Map<String, dynamic>?) != null
              ? Specifications.fromJson(
                json?['specifications'] as Map<String, dynamic>,
              )
              : null,
      description: json?['description'] as String?,
      price: json?['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt,
    'imageCarousel': imageCarousel,
    'specifications': (specifications as Specifications?)?.toJson(),
    'description': description,
    'price': price,
  };
}

class Specifications extends SpecificationsEntity {
  Specifications({
    super.rAM,
    super.storage,
    super.chip,
    super.camera,
    super.display,
  });

  factory Specifications.fromJson(Map<dynamic, dynamic>? json) {
    return Specifications(
      rAM: json?['RAM'] as String?,
      storage: json?['storage'] as String?,
      chip: json?['chip'] as String?,
      camera: json?['camera'] as String?,
      display: json?['display'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'RAM': rAM,
    'storage': storage,
    'chip': chip,
    'camera': camera,
    'display': display,
  };
}
