import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/model/cart_model.dart';
import 'package:ubazar/model/product_model.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/viewModel/product_bloc/add_product_cubit.dart';

import 'box_decoration.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final int index;

  const ProductTile({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    if (product.productList != null) {
      productList.clear();
      for (var data in product.productList!) {
        productList.add(CartModel(product: data));
      }
    }

    debugPrint("Length-> ${productList.length}");

    var size = MediaQuery.of(context).size;

    return BlocBuilder<ProductCubit, CartState>(
        builder: (context, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: size.aspectRatio * 1 / 0.7,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: productList.length,
              itemBuilder: (context, index) => Container(
                  decoration: boxDecoration(),
                  child: Stack(children: [
                    Column(
                      children: [
                        //product image
                        Center(
                            //The above code is commented out as there is no valid image path
                            child:
                                // productList[index].product!.imagePath != null?
                                //     Image.network(productList[index].product!.imagePath.toString(), height: 120, width: 120,
                                //       scale: 4,)
                                //     :Image.asset(
                                //   'assets/img_broccoli.png',height: 120, width: 120,
                                //   scale: 4,
                                // )
                                Image.asset(
                          'assets/img_broccoli.png',
                          height: 120,
                          width: 120,
                          scale: 4,
                        )),

                        //product name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product.productList![index].name != null
                                ? product.productList![index].name.toString()
                                : "Product Name",
                            style: const TextStyle(
                                color: Color(grey),
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        //product price
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //taka icon
                            Image.asset(
                              'assets/ic_taka.png',
                              scale: 6,
                              color: const Color(green),
                            ),
                            //amount
                            Text(
                              product.productList![index].oldPrice.toString(),
                              style: const TextStyle(
                                  color: Color(green),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red),
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            //taka icon
                            Image.asset(
                              'assets/ic_taka.png',
                              scale: 5,
                              color: const Color(green),
                            ),
                            //amount
                            Text(
                              //product price
                              product.productList![index].price.toString(),
                              style: const TextStyle(
                                  color: Color(green),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),

                        //divider
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                            height: 1,
                            decoration: boxDecoration(
                              borderRadius: 0,
                              color: const Color.fromRGBO(72, 183, 73, 0.2),
                            )),

                        //update quantity & add quantity, remove quantity button
                        productList[index].quantity != 0
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //remove quantity
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          //decrement the quantity
                                          if (productList[index].quantity > 0) {
                                            productList[index].quantity--;
                                            context
                                                .read<ProductCubit>()
                                                .upadateProducttemState();
                                          }
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Color(green),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //update quantity text
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Color.fromRGBO(
                                                      72, 183, 73, 0.2)),
                                              left: BorderSide(
                                                  color: Color.fromRGBO(
                                                      72, 183, 73, 0.2)))),
                                      child: Center(
                                          child: Text(
                                        productList[index].quantity.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(green)),
                                      )),
                                    ),
                                  ),

                                  //add to quantity
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          //increment quantity
                                          productList[index].quantity++;
                                          context
                                              .read<ProductCubit>()
                                              .upadateProducttemState();

                                          // int idx = -1;
                                          //
                                          // for (var data in productList) {
                                          //   idx++;
                                          //   debugPrint(
                                          //       "$idx quantity-> ${data.quantity}");
                                          // }
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Color(green),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :
                            //add to cart button
                            TextButton(
                                onPressed: () {
                                  productList[index] = CartModel(
                                      quantity: 1,
                                      product: productList[index].product,
                                      isAddToFavorite:
                                          productList[index].isAddToFavorite);
                                  context.read<ProductCubit>().upadateProducttemState();
                                },
                                child: const Text(
                                  "Add to cart",
                                  style: TextStyle(color: Color(green)),
                                )),
                      ],
                    ),

                    //add to favorite
                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            productList[index] = CartModel(
                                isAddToFavorite:
                                    !productList[index].isAddToFavorite,
                                quantity: productList[index].quantity,
                                product: productList[index].product);
                            context.read<ProductCubit>().upadateProducttemState();

                            int idx = -1;
                            for (var d in productList) {
                              idx++;
                              debugPrint("Favorite $idx-> ${d.quantity}");
                            }
                          },
                          //if item added to favorite then icon should be change
                          icon: productList[index].isAddToFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Color(grey),
                                ),
                        )),
                  ])),
            )));
  }
}
