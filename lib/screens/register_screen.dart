import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/auth_states.dart';
import 'package:shop_app_handeling_apis/screens/login_screen.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';
import 'package:shop_app_handeling_apis/shared/constants.dart';
import 'package:shop_app_handeling_apis/widgets/shared/custom_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (BuildContext context, state) {
            if(state is RegisterSuccessState){
               if (state.loginModel.status) {
                CachedHelper.putData('token', state.loginModel.data!.token);
                Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              } else {
                 Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
              }
            }
            if(state is RegisterErrorState){
              Fluttertoast.showToast(
                msg: state.error,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            }
          },
          builder: (BuildContext context, Object? state) {
            AuthCubit authCubit = AuthCubit.get(context);
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomFormField(
                                label: 'User name',
                                controller: userNameController,
                                type: TextInputType.emailAddress,
                                prefixIcon: Icons.person,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "User name must not be empty"
                                      : null;
                                },
                              ),
                              CustomFormField(
                                label: 'Phone',
                                controller: phoneController,
                                type: TextInputType.phone,
                                prefixIcon: Icons.phone,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Please provide a phone number"
                                      : null;
                                },
                              ),
                              CustomFormField(
                                label: 'Email',
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                prefixIcon: Icons.email_outlined,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Email must not be empty"
                                      : null;
                                },
                              ),
                              CustomFormField(
                                label: 'Password',
                                controller: passwordController,
                                obscure: authCubit.isObscured,
                                type: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock_outline,
                                suffixIcon: authCubit.isObscured
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                onSuffixTapped: () {
                                  authCubit.changePasswordVisibility();
                                },
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Password is too short"
                                      : null;
                                },
                              ),
                              CustomFormField(
                                label: 'Confirm Password',
                                controller: confirmPwdController,
                                obscure: authCubit.isObscured,
                                type: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock_outline,
                                validator: (value) {
                                  return (value!.isEmpty ||
                                          value != passwordController.text)
                                      ? "This must be identical to the password"
                                      : null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: MaterialButton(
                                  color: kPrimaryColor,
                                  textColor: Colors.white,
                                  minWidth: double.infinity,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      authCubit.register(userData: {
                                        'name': userNameController.text,
                                        'phone': phoneController.text,
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                      });
                                    }
                                  },
                                  child: authCubit.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          'REGISTER',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('You have an account?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('LOGIN'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
