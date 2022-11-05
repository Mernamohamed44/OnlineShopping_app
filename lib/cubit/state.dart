abstract class AppState {}

class InitialState extends AppState {}

class ChangeVisibilityPassword extends AppState {}

class SuccessSignUPState extends AppState {}

class LoadingSignUPState extends AppState {}

class ErrorSignUPState extends AppState {}

class SuccessSignInState extends AppState {
  String uid;
  SuccessSignInState(this.uid);
}

class LoadingSignInState extends AppState {}

class ErrorSignInState extends AppState {
  String error;
  ErrorSignInState(this.error);
}

class CreateUserState extends AppState {}

class ChangeNavBottomState extends AppState {}

class SuccessGetCategoriesState extends AppState {}

class LoadingGetCategoriesState extends AppState {}

class ErrorGetCategoriesState extends AppState {}
class SuccessAddToCartsState extends AppState {}

class LoadingAddToCartsState extends AppState {}

class ErrorAddToCartsState extends AppState {}
