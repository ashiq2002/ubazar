import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ubazar/repository/ubazar_base_repository.dart';
import 'package:ubazar/repository/ubazar_repository.dart';
import 'package:ubazar/viewModel/home_bloc/home_event.dart';
import 'package:ubazar/viewModel/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final UbazarBaseRepository _repository;

  HomeBloc({required UbazarRepository repository,}): _repository = repository, super(CategoryLoadingState()){

    on<CategoryLoadedEvent>(_categoryItemEvent);
  }

  //category item event
  void _categoryItemEvent(CategoryLoadedEvent event, Emitter<HomeState> emit) async{
    try{

      final categories = await _repository.getCategories();
      emit(CategoryLoadedState(categories: categories));

    }catch(e){
      debugPrint("Exception-> $e");
    }
  }

}