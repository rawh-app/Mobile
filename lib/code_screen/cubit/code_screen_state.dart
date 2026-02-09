class codestate {}

class codeInitial extends codestate {}

class codestateLoading extends codestate {}

class codestateSuccess extends codestate {}

class codestateFailure extends codestate {
  final String errMessage;
  codestateFailure({required this.errMessage});
}

class codestateTimerTick extends codestate {
  final int secondsLeft;
  codestateTimerTick(this.secondsLeft);
}

class codestateResendSuccess extends codestate {
  final String message;
  codestateResendSuccess(this.message);
}
