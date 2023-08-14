part of 'downloader_bloc.dart';

abstract class DownloaderState extends Equatable {
  const DownloaderState(this.value);
  final double value;
  @override
  List<Object> get props => [value];
}

class DownloaderInitial extends DownloaderState {
  const DownloaderInitial(super.value);
}

class DownloadFailure extends DownloaderState {
  const DownloadFailure() : super(0);
}

class DownloadRunInProgress extends DownloaderState {
  const DownloadRunInProgress(super.value);
}

class DownloadRunComplete extends DownloaderState {
  const DownloadRunComplete() : super(0);
}

class DownloadPause extends DownloaderState {
  const DownloadPause(super.value);
}
