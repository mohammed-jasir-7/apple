class ProductsEntity {
  final List<DataEntity>? data;

  ProductsEntity({
    this.data,
  });

 
}

class DataEntity {
  final String? id;
  final String? name;
  final String? createdAt;
  final List<String>? imageCarousel;
  final SpecificationsEntity? specifications;
  final String? description;
  final String? price;

  DataEntity({
    this.id,
    this.name,
    this.createdAt,
    this.imageCarousel,
    this.specifications,
    this.description,
    this.price,
  });

}

class SpecificationsEntity {
  final String? rAM;
  final String? storage;
  final String? chip;
  final String? camera;
  final String? display;

  SpecificationsEntity({
    this.rAM,
    this.storage,
    this.chip,
    this.camera,
    this.display,
  });


}