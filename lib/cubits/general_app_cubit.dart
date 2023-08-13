import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/general_app_states.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';


class GeneralAppCubit extends Cubit<GeneralAppStates>{
  GeneralAppCubit():super(ThemeInitialState());

  int index = 0;
  bool isDark = CachedHelper.getData("isDark")??false;

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
}