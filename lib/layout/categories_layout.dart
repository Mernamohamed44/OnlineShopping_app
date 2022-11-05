import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/styles/colors.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesLayout extends StatelessWidget {
  const CategoriesLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>AppCubit(context)..getDataCategories(),
    child: BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
             elevation: 0,
              selectedItemColor: defaultColor,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: const TextStyle(color:Colors.black ),
              selectedLabelStyle: TextStyle(color:defaultColor ),
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: cubit.bottomNav,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              }),
        );
      },
    ),);
  }
}
