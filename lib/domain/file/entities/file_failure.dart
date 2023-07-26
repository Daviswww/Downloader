import 'package:equatable/equatable.dart';

abstract class FileFailure extends Equatable {
  final String message;
  const FileFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class FileError extends FileFailure {
  const FileError({required super.message});
}

class SaveFileFailure extends FileFailure {
  const SaveFileFailure({required super.message});
}

class DeleteFileFailure extends FileFailure {
  const DeleteFileFailure({required super.message});
}
