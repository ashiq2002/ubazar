import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/model/base_category_item_model.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/viewModel/home_bloc/category_cubit.dart';
import 'package:ubazar/viewModel/home_bloc/home_state.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 120,
      width: size.width*0.9,
      padding: const EdgeInsets.all(5),

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItem.length,

          itemBuilder: (context, index)=> Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: BlocBuilder<CategoryCubit, BaseCategoryItemState>(builder: (context, state)=>Column(
              children: [

                InkWell(
                  radius: 12,
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      duration: const Duration(milliseconds: 500),
                      content: Text("Tap $index"),
                    ));
                    context.read<CategoryCubit>().updateIndex(index);
                  },

                  child: Container(
                    height: 70,
                    width: 70,
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(-2, 2),
                              blurRadius: 5
                          )
                        ]
                    ),

                    child: Image.asset(categoryItem[index].iconPath, scale: 1,),
                  ),
                ),
                const SizedBox(height: 5,),
                Text(categoryItem[index].category, style: TextStyle(color: Color(state.index == index? green : grey)),)
              ],
            ),)
          )
      ),
    );
  }
}
