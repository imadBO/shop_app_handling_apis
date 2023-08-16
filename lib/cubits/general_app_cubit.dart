import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/general_app_states.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';


class GeneralAppCubit extends Cubit<GeneralAppStates>{
  GeneralAppCubit():super(ThemeInitialState());

  int index = 0;
  bool isDark = CachedHelper.getData("isDark")??false;
  bool showOnboarding = CachedHelper.getData('showOnboarding')??true;
  bool isVisible = false;
  List<String> onBoardingTitles = [
    "Welcome to the Ultimate Shopping Experience!",
    "Unleash Your Inner Shopper: Discover Our E-Shop Wonderland!",
    "Step into the World of Endless Choices: Your E-Shop Journey Begins!",
  ];
  List<String> onBoardingPassages = [
    "Every click, swipe, and tap is a step towards discovering the latest trends, exclusive deals, and a world of products at your fingertips.",
    "Whether you're seeking a unique gift or treating yourself to something special, our e-shop has it all.",
    "Enjoy seamless browsing, secure transactions, and timely delivery, all tailored to your convenience.",
  ];
  List<String> onBoardingImages = [
    "assets/images/6.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];

  static GeneralAppCubit get(context) => BlocProvider.of(context);

  void toggleMode(){
    isDark = !isDark;
    CachedHelper.putData("isDark", isDark);
    emit(ThemeChangedState());
  }

  void updateIndex(int value){
    index = value;
    emit(BottomNavUpdateIndexState());
  }

  void changePasswordVisibility(){
    isVisible = !isVisible;
    emit(PasswordVisibilityState());
  }
}