import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_states.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/screens/shop_screen_layout.dart';
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
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ShopScreenLayout(),
              ),
            );
          }
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
              msg: state.error,
              backgroundColor: ColorsManager.error,
              textColor: ColorsManager.white,
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
                          StringsManager.registerPageLabel,
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
                              label: StringsManager.usernameLabel,
                              controller: userNameController,
                              type: TextInputType.emailAddress,
                              prefixIcon: Icons.person,
                              validator: (value) {
                                return value!.isEmpty
                                    ? StringsManager.usernameEmpty
                                    : null;
                              },
                            ),
                            CustomFormField(
                              label: StringsManager.phoneLabel,
                              controller: phoneController,
                              type: TextInputType.phone,
                              prefixIcon: Icons.phone,
                              validator: (value) {
                                return value!.isEmpty
                                    ? StringsManager.phoneEmpty
                                    : null;
                              },
                            ),
                            CustomFormField(
                              label: StringsManager.emailLabel,
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              prefixIcon: Icons.email_outlined,
                              validator: (value) {
                                return value!.isEmpty
                                    ? StringsManager.emailEmpty
                                    : null;
                              },
                            ),
                            CustomFormField(
                              label: StringsManager.passwordLabel,
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
                                    ? StringsManager.shortPassword
                                    : null;
                              },
                            ),
                            CustomFormField(
                              label: StringsManager.confirmPwdLabel,
                              controller: confirmPwdController,
                              obscure: authCubit.isObscured,
                              type: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock_outline,
                              validator: (value) {
                                return (value!.isEmpty ||
                                        value != passwordController.text)
                                    ? StringsManager.notIdenticalPwd
                                    : null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: MaterialButton(
                                color: ColorsManager.primary,
                                textColor: ColorsManager.white,
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
                                          color: ColorsManager.white,
                                        ),
                                      )
                                    : const Text(
                                        StringsManager.registerButtonLabel,
                                        style: TextStyle(fontSize: 18),
                                      ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(StringsManager.haveAnAccountLabel),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    StringsManager.loginButtonLabel,
                                  ),
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
    );
  }
}
