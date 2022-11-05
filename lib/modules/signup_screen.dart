import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/cubit/cubit.dart';
import 'package:final_project/cubit/state.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(context),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state)
        {

        },
        builder: (context, state) {
           var cubit =AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios),),
                        Text(
                          'S I G N U P',
                          style: Themes().themeData.textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                          txt: 'Name',
                          prefixIcon: Icons.person_outline,
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Name must not null';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                          txt: 'Phone',
                          prefixIcon: Icons.phone_outlined,
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Phone must not null';
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
                              return 'Password is too short';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(condition: state is! LoadingSignUPState ,
                            builder: (context)=>Center(child: defaultButton(txt: 'Sign up',onPress:(){
                              if(formKey.currentState!.validate()){
                                cubit.signUp(
                                    email:emailController.text
                                    ,password: passController.text,
                                  name: nameController.text,
                                  phone: phoneController.text
                                );
                              }

                            })),fallback: (context)=>const Center(child: CircularProgressIndicator(),))
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
/* const SizedBox(height: 20,),
                    ConditionalBuilder(condition: state is! LoadingLoginState ,
                        builder: (context)=>Center(child: defaultButton(txt: 'Login',onPress:(){
                      if(formKey.currentState!.validate()){
                        cubit.userLogin(email:emailController.text,password: passWordController.text);
                      }

                   })),fallback: (context)=>const Center(child: CircularProgressIndicator(),))*/
