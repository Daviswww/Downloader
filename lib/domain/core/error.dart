import 'package:equatable/equatable.dart';

abstract class Error extends Equatable {
  final String message;
  const Error({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class IsolateError extends Error {
  const IsolateError({required super.message});
}
