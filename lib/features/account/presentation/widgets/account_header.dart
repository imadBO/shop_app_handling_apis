import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_cubit.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
    required this.accountCubit,
  });

  final AccountCubit accountCubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: ColorsManager.darkGrey,
            child: CachedNetworkImage(
              imageUrl: accountCubit.profile!.image,
              placeholder: (context, url) => const Icon(
                Icons.person_2_outlined,
                color: ColorsManager.lightGrey,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.broken_image,
                color: ColorsManager.lightGrey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            accountCubit.profile!.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: ColorsManager.primary,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}