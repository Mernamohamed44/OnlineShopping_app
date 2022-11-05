import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/models/categories_model.dart';
import 'package:final_project/models/users_model.dart';
import 'package:final_project/modules/cart_screen.dart';
import 'package:final_project/modules/categories_screen.dart';
import 'package:final_project/modules/checkout_screen.dart';
import 'package:final_project/modules/orders_screen.dart';
import 'package:final_project/network/remote/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppCubit extends Cubit<AppState> {
  AppCubit(context) : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPass = true;

  changeVisibilityPassword() {
    isPass = !isPass;
    suffix =
    isPass ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityPassword());
  }

  signUp({required email, required password, required name, required phone}) {
    emit(LoadingSignUPState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password).
    then((value) =>
    {
      createUser(email: email, name: name, phone: phone, uId: value.user!.uid),
      emit(SuccessSignUPState())
    }).catchError((error) {
      emit(ErrorSignUPState());
    });
  }

  UserModel? model;

  createUser({
    required String email,
    required String name,
    required String phone,
    required String uId
  }) {
    model = UserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,
        image: 'https://th.bing.com/th/id/OIP.qq0pMkKMcFo0iqqo9m_OTwHaKo?pid=ImgDet&w=500&h=718&rs=1'

    );
    FirebaseFirestore.instance.collection('users').doc(uId).
    set(model!.toMap()).then((value) =>
    {
      emit(CreateUserState())
    });
  }

  signIn({required email, required password}) {
    emit(LoadingSignInState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password).
    then((value) =>
    {
      emit(SuccessSignInState(value.user!.uid)),
    }).catchError((error) {
      emit(ErrorSignInState(error.toString()));
    });
  }

  int currentIndex = 0;

  changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeNavBottomState());
  }

  List<BottomNavigationBarItem> bottomNav = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined), label: 'Categories'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'carts'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_outline), label: 'Check Out'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.catching_pokemon_outlined), label: 'Orders'),
  ];
  List screen = [
    const CategoriesScreen(),
    const CartScreen(),
    const CheckOutScreen(),
    const OrderScreen()
  ];
  CategoriesModel?categoriesModel;
  List<dynamic>? categories = [];
  void getDataCategories() async {
    emit(LoadingGetCategoriesState());
     categoriesModel = await DioHelper().getCategoriesData().then((value) {
      print(value[0].title);
      categories=value;
      emit(SuccessGetCategoriesState());
    }).catchError((error) {
      print("the error is ${error.toString()}");
      emit(ErrorGetCategoriesState());
    });
  }
}