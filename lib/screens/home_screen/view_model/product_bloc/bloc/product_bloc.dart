import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobitech_task/core/api_service/api_service.dart';
import 'package:mobitech_task/screens/home_screen/model/product_model.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/event/product_event.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/state/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductModel> list = [];

  ProductBloc() : super(ProductInitialState()) {
    on<ProductListOnTapEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());

        final result = await ApiService.getProductList();

        list = result;

        emit(ProductSuccessState(productModel: list));
      } catch (err) {
        emit(ProductErrorState(errorMessage: err.toString()));
      }
    });

    on<ProductListOnQueryEvent>((event, emit) {
      //if query is empty from text field we return already fetched api data
      if (event.queryTxt.isEmpty) {
        emit(ProductSuccessState(productModel: list));
        return;
      }
      //for filter the list and give the sorted list
      final filterList = list.where((element) {
        if ((element.name?.toLowerCase() ?? "").contains(
              event.queryTxt.toLowerCase(),
            ) ||
            ((element.price?.toLowerCase() ?? "").contains(
              event.queryTxt.toLowerCase(),
            ))) {
          return true;
        } else {
          return false;
        }
      }).toList();

      emit(ProductSuccessState(productModel: filterList));
    });
  }
}
