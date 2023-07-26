import 'package:equatable/equatable.dart';

abstract class DownloaderFailure extends Equatable {
  final String message;
  const DownloaderFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class DownloaderPauseFailure extends DownloaderFailure {
  const DownloaderPauseFailure({required super.message});
}

class DownloaderResumeFailure extends DownloaderFailure {
  const DownloaderResumeFailure({required super.message});
}

class DownloaderStartFailure extends DownloaderFailure {
  const DownloaderStartFailure({required super.message});
}

class DownloaderCancelFailure extends DownloaderFailure {
  const DownloaderCancelFailure({required super.message});
}
