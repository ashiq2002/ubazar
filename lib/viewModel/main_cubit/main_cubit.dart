import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ubazar/view/cart/cart_screen.dart';
import 'package:ubazar/view/favorite/favorite_screen.dart';
import 'package:ubazar/view/home/home_screen.dart';
import 'package:ubazar/view/profile/profile_screen.dart';
import 'package:ubazar/viewModel/main_cubit/main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit() : super(MainState(0));

  void updateIndex(int idx){
    emit(MainState(state.index = idx));
  }

  Widget get currentPage => pages[state.index];

}

List<Widget> pages = const [
  HomeScreen(),
  CartScreen(),
  FavoriteScreen(),
  ProfileScreen()
];