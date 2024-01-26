abstract class AccountStates {}

class AccountInitialState extends AccountStates {}

class ProfileFetchedSuccessState extends AccountStates {}

class ProfileFetchedErrorState extends AccountStates {
  final String error;

  ProfileFetchedErrorState(this.error);
}

class ProfileLoadingState extends AccountStates {}
