import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/colors.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          List? listOfProducts=AppCubit.get(context).categories;
          return Scaffold(
            body: SafeArea(
              child: ConditionalBuilder(
                  condition: checkOuts.isNotEmpty,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        Text('Products you Select',style: Themes().themeData.textTheme.headline1!.copyWith(
                            fontSize: 20,
                            color: defaultColor
                        ),),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildCheckOutItem(context,listOfProducts![carts[checkOuts[index]]],index),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: checkOuts.length),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Total Price :${finalPrice.floor()}',style:Themes().themeData.textTheme.headline1!.copyWith(
                                height: 0,
                                color: Colors.red,
                                fontSize: 20
                            ),)
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Text('Enter your address',style: Themes().themeData.textTheme.headline1!.copyWith(
                            fontSize: 18
                        ),),
                        defaultTextField(
                            txt: 'Address',
                            type: TextInputType.streetAddress,
                            prefixIcon: Icons.account_balance_outlined
                        ),
                        const SizedBox(height: 10,),
                        defaultButton(
                            txt: 'Make Order',
                            onPress: ()
                            {
                            }
                        )
                      ],
                    ),
                  ),
                  fallback:(context)=>  Center(
                    child: Text('NO PRODUTS CHECKED OUT YET ...',style: Themes().themeData.textTheme.headline1!.copyWith(
                        fontSize: 20,
                        color: defaultColor
                    )),
                  ))
            ),
          );
        },
        listener: (context,state){});
  }
}