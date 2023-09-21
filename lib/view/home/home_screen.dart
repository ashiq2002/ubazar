import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubazar/res/app_colors.dart';
import 'package:ubazar/route/routes_name.dart';
import 'package:ubazar/util/system_util.dart';
import 'package:ubazar/viewModel/home_bloc/home_bloc.dart';
import 'package:ubazar/viewModel/home_bloc/home_event.dart';
import 'package:ubazar/viewModel/home_bloc/home_state.dart';
import 'package:ubazar/widget/carousel_slider.dart';
import 'package:ubazar/widget/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemUtil.setStatusBarColor(darkGreen);
    context.read<HomeBloc>().add(CategoryLoadedEvent());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(green),
          title: Image.asset(
            'assets/img_logo.png',
            height: 40,
            width: 80,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/ic_menu.png',
              height: 28,
              width: 28,
              scale: 3,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            //search icon
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            //cart icon
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/ic_cart.png',
                  height: 28,
                  width: 28,
                  scale: 3,
                )),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => Column(
            children: [
              //slider
              const SizedBox(
                  height: 180, width: double.infinity, child: CarouselSlider()),

              //base category items
              const Categories(),

              //all category items
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: state is CategoryLoadedState? ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(-2, 2),
                              blurRadius: 5)
                        ]),

                    //category content
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.productScreen, arguments: state.categories[index].name);
                      },
                      child: ListTile(
                        leading: Image.asset(
                          'assets/ic_fish.png',
                          scale: 4,
                        ),
                        //category name
                        title: Text(state.categories[index].name != null?state.categories[index].name!.trim():"Title"),
                        titleTextStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),

                        //category description
                        subtitle: const Text("Lorem ipsum diord sit amit, sjjrk aosjet constectia adiposimg sot"),
                        subtitleTextStyle: const TextStyle(fontSize: 12),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 32, color: Colors.green,),
                      ),
                    ),
                  ),
                ),
              ): const Center(child: CircularProgressIndicator(),),
              )
            ],
          ),
        ));
  }
}
