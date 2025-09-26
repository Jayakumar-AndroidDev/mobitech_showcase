import 'package:mobitech_task/screens/home_screen/model/product_model.dart';

class ProductState {
  
}

class ProductInitialState extends ProductState {
  
}

class ProductLoadingState extends ProductState {
  
}

class ProductSuccessState extends ProductState {
  List<ProductModel> productModel;
  ProductSuccessState({required this.productModel});
}

class ProductErrorState extends ProductState {
  String errorMessage;
  ProductErrorState({required this.errorMessage});
}