import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/viewModel/product_bloc/add_product_cubit.dart';
import 'package:ubazar/viewModel/product_bloc/product_bloc.dart';
import 'package:ubazar/viewModel/product_bloc/product_even.dart';
import 'package:ubazar/viewModel/product_bloc/product_state.dart';
import 'package:ubazar/widget/box_decoration.dart';
import 'package:ubazar/widget/product_tile.dart';
import 'package:badges/badges.dart' as badges;


class ProductScreen extends StatelessWidget {
  final String query;
  const ProductScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductLoadedEvent(query: query));

    return BlocBuilder<ProductBloc, ProductSate>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(green),
                title: Text(query),
                titleTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 18),
                centerTitle: true,
                //back button
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context); //pop back to previous screen
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white,
                ),

                actions: [

                  //cart button
                  badges.Badge(
                    badgeContent: const Text("3", style: TextStyle(color: Color(green)),),
                    position: badges.BadgePosition.topEnd(top: -2, end: 26),
                    showBadge: true,
                    ignorePointer: false,
                    badgeStyle: const badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: Colors.white,
                    ),
                    child:  IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.cartScreen);
                        },
                        icon: Image.asset(
                          'assets/ic_cart.png',
                          scale: 3,
                        )),
                  )
                ],
              ),
              body: Column(
                children: [
                  //product found & filter button
                  Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: boxDecoration(borderRadius: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //number of item
                        state is ProductLoadedState?
                        Text("${state.productModel.productList!.length} Products Found")
                        :const Text("0 Products Found"),

                        //filter button
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/ic_filter.png',
                              scale: 3,
                            ))
                      ],
                    ),
                  ),

                  //product list
                  state is ProductLoadedState
                      ? Expanded(child: ProductTile(product: state.productModel, index: 0))
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ),
            ));
  }
}

