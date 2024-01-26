import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        iconData,
        color: label == StringsManager.logoutLabel
            ? ColorsManager.error
            : ColorsManager.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: label == StringsManager.logoutLabel
            ? ColorsManager.error
            : ColorsManager.primary,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: label == StringsManager.logoutLabel
              ? ColorsManager.error
              : ColorsManager.primary,
        ),
      ),
      onTap: onTap,
    );
  }
}
