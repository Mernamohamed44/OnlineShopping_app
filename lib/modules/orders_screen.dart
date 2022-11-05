import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(context),
      child: BlocConsumer<AppCubit,AppState>(
          builder: (context,state){
            List? products=AppCubit.get(context).categories;
            return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                        children: [
                          Text('Numbers of Products is ${checkOuts.length} Products',style:TextStyle(color: defaultColor,height:1,fontSize: 20,fontWeight:FontWeight.w800  )),
                          const SizedBox(height: 10,),
                          Text('Total Price is $finalPrice LE',style:TextStyle(color: defaultColor,height:1,fontSize: 20,fontWeight:FontWeight.w800  )),
                          const SizedBox(height: 10,),
                          Text('checkedout this product in $cdate',style:TextStyle(color: defaultColor,height:1,fontSize: 20,fontWeight:FontWeight.w800  )),
                          const SizedBox(height: 15,),
                          Container(
                            width: double.infinity,
                            child: ListView.separated(
                              shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    buildOrdersItem(context,products![carts[checkOuts[index]]],index),
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: products!.length),
                          ),
                          defaultButton(txt: 'Cancel')
                        ]),
                  ),
                )
            );
          },
          listener: (context,state){}),
    );
  }
}
