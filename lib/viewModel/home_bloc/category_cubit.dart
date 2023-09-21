import 'package:bloc/bloc.dart';
import 'package:ubazar/viewModel/home_bloc/home_state.dart';

class CategoryCubit extends Cubit<BaseCategoryItemState>{
  CategoryCubit():super(BaseCategoryItemState(index: 0));

  void updateIndex(int idx){
    emit(BaseCategoryItemState(index: idx));
  }
}