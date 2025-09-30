import '../../data/repositories/product_repository_impl.dart';
import '../entities/product_entity.dart';


class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<List<ProductEntity>> execute() {
    return repository.getProducts();
  }
}