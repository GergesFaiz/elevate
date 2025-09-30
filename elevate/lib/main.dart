import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domin/usecases/get_products_usecase.dart';
import 'presentation/providers/product_provider.dart';
import 'presentation/screens/product_list_screen.dart';

void main() {
  final dataSource = ProductRemoteDataSource();
  final repository = ProductRepositoryImpl(remoteDataSource: dataSource);
  final getProductsUseCase = GetProductsUseCase(repository: repository);

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  const MyApp({Key? key, required this.getProductsUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(getProductsUseCase: getProductsUseCase),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    );
  }
}