import 'package:equatable/equatable.dart';

abstract class IoslateFailure extends Equatable {
  final String message;
  const IoslateFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class StartIsolateFailure extends IoslateFailure {
  const StartIsolateFailure({required super.message});
}

class PauseIsolateFailure extends IoslateFailure {
  const PauseIsolateFailure({required super.message});
}

class ResumeIsolateFailure extends IoslateFailure {
  const ResumeIsolateFailure({required super.message});
}

class CancelIsolateFailure extends IoslateFailure {
  const CancelIsolateFailure({required super.message});
}
