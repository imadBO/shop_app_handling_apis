import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_cubit.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_states.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/widgets/custom_form_field.dart';

class ChangePwdForm extends StatefulWidget {
  const ChangePwdForm({super.key});

  @override
  State<ChangePwdForm> createState() => _ChangePwdFormState();
}

class _ChangePwdFormState extends State<ChangePwdForm> {
  final TextEditingController currentPwd = TextEditingController();

  final TextEditingController newPwd = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const ShapeDecoration(
          color: ColorsManager.platinum,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                10,
                10,
                10,
                MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.lock_reset,
                      size: 60,
                      color: ColorsManager.green,
                    ),
                  ),
                  CustomFormField(
                    label: StringsManager.currentPwdLabel,
                    controller: currentPwd,
                    type: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    validator: (value) {
                      return value!.isEmpty
                          ? StringsManager.shortPassword
                          : null;
                    },
                    obscure: true,
                  ),
                  CustomFormField(
                    label: StringsManager.newPwdLabel,
                    controller: newPwd,
                    type: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    validator: (value) {
                      return value!.isEmpty
                          ? StringsManager.shortPassword
                          : null;
                    },
                    obscure: true,
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<AccountCubit, AccountStates>(
                    listener: (BuildContext context, AccountStates state) {
                      if (state is PasswordChangedSuccessState) {
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (BuildContext context, state) {
                      final accountCubit = AccountCubit.get(context);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              accountCubit.changePassword({
                                "current_password": currentPwd.text,
                                "new_password": newPwd.text,
                              });
                            }
                          },
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          textColor: ColorsManager.white,
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: accountCubit.isPwdChangeLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsManager.white,
                                  ),
                                )
                              : const Text(
                                  StringsManager.changePwdLabel,
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
