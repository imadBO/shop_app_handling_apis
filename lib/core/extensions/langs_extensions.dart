import 'package:shop_app_handeling_apis/core/enums/langs.dart';

extension StringName on Langs {
  String getString() {
    switch (this) {
      case Langs.arabic:
        return 'ar';
      case Langs.english:
        return 'en';
    }
  }
}
