import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/layout/categories_layout.dart';
import 'package:final_project/modules/signup_screen.dart';
import 'package:final_project/network/local/shared_pref.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/shard/constants.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(context),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state)
        {
          if(state is SuccessSignInState)
          {
           CacheHelper.saveData(key:'token',value:state.uid).
           then((value) => {
             token=state.uid,
             print(token),
           navigateTo(context, const CategoriesLayout())
           });
          }
          else if(state is ErrorSignInState)
          {
            showToast(message: state.error.toString(), state:ToastState.error);
          }
        },
        builder: (context, state) {
          var cubit =AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'L O G I N',
                          style: Themes().themeData.textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                          txt: 'Email',
                          prefixIcon: Icons.email_outlined,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'email must not null';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextField(
                          isPass: cubit.isPass,
                          suffixOnPress: () {
                            cubit.changeVisibilityPassword();
                          },
                          suffixIcon:cubit.suffix,
                          txt: 'PassWord',
                          prefixIcon: Icons.lock_outline,
                          controller: passController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty || value.length <= 6) {
                              return 'Password  is too short';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(condition: state is! LoadingSignInState ,
                            builder: (context)=>Center(child: defaultButton(txt: 'Sign In',onPress:(){
                              if(formKey.currentState!.validate()){
                                cubit.signIn(email:emailController.text,password: passController.text);
                              }

                            })),fallback: (context)=>const Center(child: CircularProgressIndicator(),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont have account ?',
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, SignUpScreen());
                              },
                              child: const Text(
                                'Sign Up',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
