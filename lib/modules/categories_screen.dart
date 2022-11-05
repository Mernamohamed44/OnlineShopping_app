import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/colors.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var listOfProducts=AppCubit.get(context).categories;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Themes().themeData.appBarTheme.backgroundColor,
              actions:[Icon(Icons.search_outlined,color:defaultColor,)],
              elevation: 0,
              title: Text(' Online Shopping',style: Themes().themeData.textTheme.headline2!.copyWith(
                  color: defaultColor
              ),),
              centerTitle: true,
            ),
            body: ListView.separated(
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildCategoryItem(context,listOfProducts![index],index),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: listOfProducts!.length),
          );
        },
        listener: (context,state){});
  }
}