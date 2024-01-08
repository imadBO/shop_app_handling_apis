import 'package:shop_app_handeling_apis/features/cart/domain/entities/update_cart_entity.dart';

class UpdateCartModel extends UpdateCartEntity {
  UpdateCartModel({
    required super.subTotal,
    required super.total,
  });
  factory UpdateCartModel.fromJSON(Map<String, dynamic> json) {
    return UpdateCartModel(
      subTotal: json['sub_total'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
}
