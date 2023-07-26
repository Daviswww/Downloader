import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/infrastructure/downloader/downloader_repository.dart';
import 'package:myapp/infrastructure/downloader/downloader_repository_impl.dart';
import 'package:myapp/infrastructure/file/file_repository_impl.dart';
import 'package:myapp/infrastructure/hive/hive_repository_impl.dart';
import 'package:myapp/presentation/screens/home/components/item_progress.dart';
import 'package:myapp/presentation/screens/home/components/item_text_field.dart';

class HeaderItem extends StatefulWidget {
  const HeaderItem({super.key, required this.initUrl});
  final String initUrl;
  @override
  State<HeaderItem> createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  late DownloaderRepository downloaderRepository;
  late TextEditingController textEditingController;
  late StreamController<double> streamController;
  late bool isStart;
  late double progressValue;

  @override
  void initState() {
    isStart = false;
    progressValue = 0;
    textEditingController = TextEditingController(text: widget.initUrl);
    streamController = StreamController<double>();
    downloaderRepository = DownloaderRepositoryImpl(
      fileRepository: FileRepositoryImpl(),
      hiveRepository: HiveRepositoryImpl(),
      streamController: streamController,
    );
    streamController.stream.listen((event) {
      setState(() {
        progressValue = event == 1 ? 0 : event;
        isStart = event == 1 ? false : true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(),
        color: Colors.blueGrey,
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
                        downloaderRepository.pause();
                      },
                      icon: const Icon(Icons.file_download_off),
                    ),
                    IconButton(
                      onPressed: () {
                        downloaderRepository.resume();
                      },
                      icon: const Icon(Icons.loop_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        downloaderRepository.cancel();
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isStart = !isStart;
                    });
                    downloaderRepository.start(
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
