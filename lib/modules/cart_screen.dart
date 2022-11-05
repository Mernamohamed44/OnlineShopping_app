import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/colors.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          List? products=AppCubit.get(context).categories;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Themes().themeData.appBarTheme.backgroundColor,
              elevation: 0,
              title: Text(' Carts ',style: Themes().themeData.textTheme.headline2!.copyWith(
                  color: defaultColor
              ),),
              centerTitle: true,
            ),
            body: ConditionalBuilder(
                condition: carts.isNotEmpty,
                builder: (context)=>ListView(
                  children:[
                    Text('Total Prices ${totalPrice.ceil()}',style:TextStyle(color: defaultColor,height:3,fontSize: 25,fontWeight:FontWeight.w800  )  ,),
                    const SizedBox(height: 10,),
                    ListView.separated(
                    shrinkWrap: true,
                      itemBuilder: (context,index)=>buildCartItem(context,products![carts[index]] ,index),
                      separatorBuilder:(context,index)=> const Divider(),
                      itemCount: carts.length),
                ]),
                fallback: (context)=>  Center(
                  child: Text('NO PRODUTS IN CARTS YET ...',style: Themes().themeData.textTheme.headline1!.copyWith(
                      fontSize: 20,
                      color: defaultColor
                  )),
                )),
          );
        },
        listener: (context, state) {});
  }
}