import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_cubit.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_states.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/widgets/account_header.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/widgets/account_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.accountTitle),
      ),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          final accountCubit = AccountCubit.get(context);
          return accountCubit.profileLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : accountCubit.profile == null
                  ? const Center(
                      child: Text(StringsManager.defaultError),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AccountHeader(accountCubit: accountCubit),
                            const SizedBox(height: 15),
                            const Text(
                              StringsManager.profileLabel,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: ColorsManager.primary,
                              ),
                            ),
                            AccountTile(
                              label: StringsManager.manageUserLabel,
                              iconData: Icons.person,
                              onTap: () {},
                            ),
                            AccountTile(
                              label: StringsManager.ordersLabel,
                              iconData: Icons.shopping_bag,
                              onTap: () {},
                            ),
                            const Text(
                              StringsManager.settingsTitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: ColorsManager.primary,
                              ),
                            ),
                            AccountTile(
                              label: StringsManager.changePwdLabel,
                              iconData: Icons.lock,
                              onTap: () {},
                            ),
                            AccountTile(
                              label: StringsManager.themeLabel,
                              iconData: Icons.brightness_2,
                              onTap: () {},
                            ),
                            AccountTile(
                              label: StringsManager.logoutLabel,
                              iconData: Icons.logout,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
