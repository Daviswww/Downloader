import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:myapp/infrastructure/dio/dio_repository.dart';
import 'package:myapp/infrastructure/dio/dio_repository_impl.dart';
import 'package:myapp/infrastructure/hive/hive_repository.dart';
import 'package:myapp/infrastructure/hive/hive_repository_impl.dart';
import 'package:myapp/infrastructure/isolate/isolate_repository.dart';
import 'package:myapp/infrastructure/isolate/isolate_repository_impl.dart';
import 'package:myapp/presentation/screens/home/components/item_progress.dart';
import 'package:myapp/presentation/screens/home/components/item_text_field.dart';

class IsolateItem extends StatefulWidget {
  const IsolateItem({
    super.key,
    required this.initUrl,
  });
  final String initUrl;
  @override
  State<IsolateItem> createState() => _IsolateItemState();
}

class _IsolateItemState extends State<IsolateItem> {
  late IsolateRepository isolateRepository;
  late DioRepository dioRepository;
  late HiveRepository hiveRepository;
  late ReceivePort receivePort;
  late TextEditingController textEditingController;
  late double progressValue;
  late bool isStart;

  @override
  void initState() {
    progressValue = 0;
    isStart = false;
    textEditingController = TextEditingController(text: widget.initUrl);

    receivePort = ReceivePort();
    isolateRepository = IsolateRepositoryImpl(receivePort: receivePort);
    dioRepository = DioRepositoryImpl();
    hiveRepository = HiveRepositoryImpl();

    receivePort.listen((message) {
      setState(() {
        progressValue = message == 100 ? 0 : message / 100;
        message == 100 ? hiveRepository.save(textEditingController.text) : null;
        isStart = message == 100 ? false : true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(),
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemTextField(
            textEditingController: textEditingController,
            isReadOnly: isStart,
          ),
          ItemProgress(progressValue: progressValue),
          isStart
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        isolateRepository.pause();
                      },
                      icon: const Icon(Icons.file_download_off),
                    ),
                    IconButton(
                      onPressed: () {
                        isolateRepository.resume();
                      },
                      icon: const Icon(Icons.loop_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        isolateRepository.cancel();
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    isolateRepository.start(
                      receivePort,
                      dioRepository.downloadFile,
                      textEditingController.text,
                    );
                  },
                  icon: const Icon(Icons.file_download),
                ),
        ],
      ),
    );
  }
}
