import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobitech_task/core/app_route/app_route.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/bloc/product_bloc.dart';
import 'package:mobitech_task/screens/home_screen/view_model/product_bloc/event/product_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc()..add(ProductListOnTapEvent(),),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: AppRoute.homeScreen,
      ),
    );
  }
}
