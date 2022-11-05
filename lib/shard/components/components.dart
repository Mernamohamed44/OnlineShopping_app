import 'package:final_project/models/categories_model.dart';
import 'package:final_project/modules/categorydetail_screen.dart';
import 'package:final_project/styles/colors.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

Widget defaultTextField(
    {String? txt,
      IconData? prefixIcon,
      IconData? suffixIcon,
      Function? validate,
      Function? suffixOnPress,
      bool isPass = false,
      TextInputType? type,
      TextEditingController? controller,
      onSubmit}) {
  return TextFormField(
    controller: controller,
    onFieldSubmitted:onSubmit,
    keyboardType: type,
    obscureText: isPass ? true : false,
    validator: (value) => validate!(value),
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: () {
          if (suffixIcon != null) {
            suffixOnPress!();
          }
        },
      ),
      label: Text('$txt'),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
    ),
  );
}
Widget defaultButton({String? txt, Function? onPress}) {
  return MaterialButton(
      minWidth: 370,
      height: 50,
      color: defaultColor,
      child: Text('$txt',style: Themes().themeData.textTheme.headline2),
      onPressed: () => onPress!());
}
navigateTo(context,widget){
  return Navigator.push(context,MaterialPageRoute(builder:(context){
    return widget;
  }));
}
void showToast({
  @required message,
  @required ToastState ?state
}){
  Fluttertoast.showToast(
      msg: message ,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state!),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{success,error,warning}
Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.success:
      color=Colors.green;
      break;
    case ToastState.error:
      color=Colors.red;
      break;
    case ToastState.warning:
      color=Colors.amber;
      break;
  }
  return color;
}
buildCategoryItem(context,CategoriesModel products,index){
  return InkWell(
    onTap: (){
      navigateTo(context,CategoryDetails(products,index) );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(products.image)))),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(products.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Row(
                      children: [
                        Text('${products.price}\t LE',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: defaultColor
                            )),
                        const Spacer(),
                        buildRating(products),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
buildRating(CategoriesModel? products){
  return RatingBarIndicator(
    rating: products!.rating!.rate.toDouble(),
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 25.0,
    direction: Axis.horizontal,
  );
}
buildCartItem(context,CategoriesModel products,index){
  return Dismissible(
    key: UniqueKey(),
    onDismissed: (direction){
      removeFromCarts(index,products.price);
      print(products.price);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(products.image)))),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(products.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Row(
                      children: [
                        Text('${products.price}\t LE',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: defaultColor
                            )),
                        const Spacer(),
                        IconButton(onPressed: ()
                        {
                          addToCheckOut(index,products.price);
                        }, icon:const Icon(Icons.shopping_cart_checkout)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
buildCheckOutItem(context,CategoriesModel products,index){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(products.image)))),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(products.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Row(
                    children: [
                      Text('${products.price}\t LE',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: defaultColor
                          )),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
buildOrdersItem(context,CategoriesModel products,index){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(products.image)))),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(products.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Row(
                    children: [
                      Text('${products.price}\t LE',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: defaultColor
                          )),
                      const Spacer(),
                      Text('Order Date $cdate')
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
List carts = [];
double totalPrice=0;
double finalPrice=0;
addTCart(index,price)
{
  carts.add(index);
  totalPrice=totalPrice+price;
  print(carts);
  return totalPrice;
}
removeFromCarts(index,price)
{
  carts.removeAt(index);
  totalPrice=totalPrice-price;
  print(totalPrice);
  return totalPrice;
}
List checkOuts=[];
String? cdate;
addToCheckOut(index,price)
{
  checkOuts.add(index);
  cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  print(checkOuts);
  finalPrice=finalPrice+price;
  return checkOuts;
}