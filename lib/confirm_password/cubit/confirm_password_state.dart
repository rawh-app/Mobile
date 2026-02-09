class ConfirmPasswordState {}

class ConfirmPasswordInitial extends ConfirmPasswordState {}

class ConfirmPasswordLoading extends ConfirmPasswordState {}

class ConfirmPasswordSuccess extends ConfirmPasswordState {}

class ConfirmPasswordFailure extends ConfirmPasswordState {
  final String errMessage;
  ConfirmPasswordFailure({required this.errMessage});
}
