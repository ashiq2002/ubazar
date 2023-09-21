import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/viewModel/main_cubit/main_cubit.dart';
import 'package:ubazar/viewModel/main_cubit/main_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
        builder: (context, state){
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 20,
                unselectedItemColor: const Color(grey),
                selectedItemColor: const Color(green),
                currentIndex: state.index,
                onTap: (index){
                  context.read<MainCubit>().updateIndex(index); //Update the page index according to the navigation item index
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
                  BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Me"),
                ]),

            body: context.read<MainCubit>().currentPage, //get the current page

          );
        }
    );
  }
}
