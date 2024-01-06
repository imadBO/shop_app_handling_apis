abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchMatchesSuccessState extends SearchStates {
  SearchMatchesSuccessState();
}

class SearchMatchesErrorState extends SearchStates {
  SearchMatchesErrorState(this.error);
  final String error;
}

class LoadingState extends SearchStates {}
