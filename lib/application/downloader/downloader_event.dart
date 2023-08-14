part of 'downloader_bloc.dart';

abstract class DownloaderEvent extends Equatable {
  const DownloaderEvent();

  @override
  List<Object> get props => [];
}

class StartDownload extends DownloaderEvent {
  final String url;

  const StartDownload(this.url);

  @override
  List<Object> get props => [url];
}

class PauseDownload extends DownloaderEvent {}

class ResumeDownload extends DownloaderEvent {}

class CancelDownload extends DownloaderEvent {}

class ProcessTicked extends DownloaderEvent {
  const ProcessTicked({required this.value});
  final double value;
}

class WriteFile extends DownloaderEvent {
  const WriteFile({required this.value});
  final double value;
}
