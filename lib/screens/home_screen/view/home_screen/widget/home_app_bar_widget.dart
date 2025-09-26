import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobitech_task/core/app_style/app_style.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/bloc/product_bloc.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/event/product_event.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: SafeArea(
        bottom: false ,
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: AppStyle.textFieldDecoration,
            focusedBorder: AppStyle.textFieldDecoration,
            label: Text('Enter name & price'),
          ),
          onChanged: (value) {
            context.read<ProductBloc>().add(ProductListOnQueryEvent(queryTxt: value));
          },
        ),
      ),
    );
  }
}