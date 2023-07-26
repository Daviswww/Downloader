import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/ioslate/entities/isolate_failure.dart';
import 'package:myapp/infrastructure/isolate/isolate_repository.dart';
import 'package:myapp/share/app_value.dart';

class IsolateRepositoryImpl implements IsolateRepository {
  final ReceivePort _receivePort;
  final String dir;
  Isolate isolate;
  Capability? capability;
  IsolateRepositoryImpl({required ReceivePort receivePort})
      : _receivePort = receivePort,
        isolate = Isolate.current,
        dir = AppValue.docPath,
        super();

  @override
  Future<Either<IoslateFailure, Unit>> start(
    ReceivePort receivePort,
    Function(List<dynamic>) function,
    String url,
  ) async {
    try {
      isolate = await Isolate.spawn(
        function,
        [_receivePort.sendPort, dir, url],
      );
      capability = isolate.pauseCapability;

      return right(unit);
    } catch (e) {
      debugPrint("$e%");
      return left(const StartIsolateFailure(message: 'Start Error'));
    }
  }

  @override
  Future<Either<IoslateFailure, Unit>> cancel() async {
    try {
      isolate.kill();
      return right(unit);
    } catch (e) {
      debugPrint("$e%");
      return left(const CancelIsolateFailure(message: 'Cancel Error'));
    }
  }

  @override
  Future<Either<IoslateFailure, Unit>> pause() async {
    try {
      final capability = isolate.pauseCapability;
      if (capability != null) {
        isolate.resume(capability);
        return right(unit);
      }
      return left(const PauseIsolateFailure(message: "Capability is null."));
    } catch (e) {
      debugPrint("$e%");
      return left(const PauseIsolateFailure(message: 'Pause Error'));
    }
  }

  @override
  Future<Either<IoslateFailure, Unit>> resume() async {
    try {
      final capability = isolate.pauseCapability;
      if (capability != null) {
        isolate.resume(capability);
        return right(unit);
      }
      return left(const ResumeIsolateFailure(message: 'Capability is null.'));
    } catch (e) {
      debugPrint("$e%");
      return left(const ResumeIsolateFailure(message: 'Resume Error'));
    }
  }
}
