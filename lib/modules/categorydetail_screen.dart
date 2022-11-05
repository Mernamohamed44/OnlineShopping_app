import 'package:final_project/models/categories_model.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/colors.dart';
import 'package:flutter/material.dart';


class CategoryDetails extends StatelessWidget {
  CategoriesModel? products;
  int index;
  CategoryDetails(this.products, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white60,
            child: SizedBox(
              width: 300,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(products!.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.deepPurple
                        )),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(products!.image)))),
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
                                    child: Text(products!.description,
                                        maxLines: 4,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.grey
                                        )),
                                  ),
                                  Text('${products!.price}\t LE',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: defaultColor
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        buildRating(products),
                        const Spacer(),
                        IconButton(onPressed: ()
                        {
                          addTCart(index,products!.price);
                        }, icon: const Icon(Icons.shopping_cart_outlined))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

