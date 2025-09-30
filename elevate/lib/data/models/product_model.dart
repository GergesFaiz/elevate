import '../../domin/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String image,
    required double price,
    required double rating,
  }) : super(
    id: id,
    title: title,
    description: description,
    image: image,
    price: price,
    rating: rating,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating']['rate'] as num).toDouble(),
    );
  }
}