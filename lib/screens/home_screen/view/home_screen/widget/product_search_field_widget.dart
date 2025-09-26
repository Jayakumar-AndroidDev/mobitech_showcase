import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobitech_task/core/app_style/app_style.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/bloc/product_bloc.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/event/product_event.dart';

class ProductSearchFieldWidget extends StatelessWidget {
  const ProductSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 45,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: AppStyle.textFieldDecoration,
              focusedBorder: AppStyle.textFieldDecoration,
              hint: Text('Enter name & price',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),),
            ),
            onChanged: (value) {
              context.read<ProductBloc>().add(ProductListOnQueryEvent(queryTxt: value));
            },
          ),
        ),
      ),
    );
  }
}