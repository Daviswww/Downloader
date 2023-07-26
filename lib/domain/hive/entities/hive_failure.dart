import 'package:equatable/equatable.dart';

abstract class HiveFailure extends Equatable {
  final String message;
  const HiveFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class DeleteHiveDataFailure extends HiveFailure {
  const DeleteHiveDataFailure({required super.message});
}

class SaveHiveDataFailure extends HiveFailure {
  const SaveHiveDataFailure({required super.message});
}
