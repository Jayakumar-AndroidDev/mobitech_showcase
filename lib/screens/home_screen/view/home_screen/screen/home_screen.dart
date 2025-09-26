import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobitech_task/screens/home_screen/view/home_screen/widget/product_search_field_widget.dart';
import 'package:mobitech_task/screens/home_screen/view/home_screen/widget/product_list_item_widget.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/bloc/product_bloc.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/state/product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          ProductSearchFieldWidget(),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is ProductErrorState) {
                  return Center(child: Text(state.errorMessage));
                }

                if (state is ProductSuccessState) {
                  return ListView.builder(
                    itemCount: state.productModel.length,
                    itemBuilder: (context, index) {
                      return ProductListItemWidget(
                        index: index,
                        item: state.productModel[index],
                      );
                    },
                  );
                }
                return Center(child: Text('No state captured!'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
