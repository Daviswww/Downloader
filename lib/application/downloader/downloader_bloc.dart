import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/file/model/write_bytes_input_model.dart';
import 'package:myapp/infrastructure/file/file_repository.dart';
import 'package:myapp/infrastructure/file/file_repository_impl.dart';
import 'package:myapp/infrastructure/image_downloader/image_downloader_repository.dart';
import 'package:myapp/infrastructure/image_downloader/image_downloader_repository_impl.dart';

part 'downloader_event.dart';
part 'downloader_state.dart';

class DownloaderBloc extends Bloc<DownloaderEvent, DownloaderState> {
  final ImageDownloaderRepository _downloaderRepository;
  final FileRepository _fileRepository;
  late StreamSubscription<List<int>> streamedResponse;

  DownloaderBloc({
    required StreamController<double> streamController,
  })  : _downloaderRepository = ImageDownloaderRepositoryImpl(),
        _fileRepository = FileRepositoryImpl(),
        super(const DownloaderInitial(0)) {
    on<DownloaderEvent>((event, emit) async {
      await _mapDownloadToState();
    });
    on<ProcessTicked>(_onTicked);
    on<StartDownload>(_onStartDownload);
    on<PauseDownload>(_onPause);
    on<CancelDownload>((event, emit) async {
      await _mapDownloadToState();
    });
    on<ResumeDownload>((event, emit) async {
      await _mapDownloadToState();
    });
  }

  Future<void> _onStartDownload(
    StartDownload event,
    Emitter<DownloaderState> emit,
  ) async {
    final start = await _downloaderRepository.start(event.url);
    start.fold(
      (l) {
        emit(const DownloadFailure());
      },
      (r) {
        r.listen((response) {
          final contentLength = response.contentLength;
          if (contentLength == null) {
            return emit(const DownloadFailure());
          }
          int download = 0;
          streamedResponse = response.stream.listen((value) async {
            sleep(const Duration(milliseconds: 200));
            download += value.length;
            add(ProcessTicked(value: download / contentLength));
          });
        });
      },
    );
  }

  Future<void> _onPause(
    PauseDownload event,
    Emitter<DownloaderState> emit,
  ) async {
    final pause = await _downloaderRepository.pause(streamedResponse);
    pause.fold(
      (l) => emit(const DownloadFailure()),
      (r) => emit(DownloadPause(0)),
    );
  }

  void _onTicked(
    ProcessTicked event,
    Emitter<DownloaderState> emit,
  ) {
    debugPrint("${event.value}");
    emit(
      event.value == 1
          ? const DownloadRunComplete()
          : DownloadRunInProgress(event.value),
    );
  }

  Future<void> _mapDownloadToState() async {}
}
