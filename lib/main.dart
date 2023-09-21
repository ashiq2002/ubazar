import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/repository/ubazar_repository.dart';
import 'package:ubazar/route/my_routes.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/viewModel/home_bloc/category_cubit.dart';
import 'package:ubazar/viewModel/home_bloc/home_bloc.dart';
import 'package:ubazar/viewModel/product_bloc/add_product_cubit.dart';
import 'package:ubazar/viewModel/product_bloc/product_bloc.dart';

import 'viewModel/main_cubit/main_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (_) => MainCubit(), lazy: true,),
        BlocProvider<CategoryCubit>(create: (_) => CategoryCubit(),),
        BlocProvider<ProductCubit>(create: (_) => ProductCubit()),
        BlocProvider<HomeBloc>(create: (_)=> HomeBloc(repository: UbazarRepository())),
        BlocProvider<ProductBloc>(create: (_)=> ProductBloc(repository: UbazarRepository())),
        ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: MyRoutes.generateRoutes,
    );
  }
}
