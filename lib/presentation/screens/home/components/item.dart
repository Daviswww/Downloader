import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/application/downloader/downloader_bloc.dart';
import 'package:myapp/share/app_value.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DownloaderBloc, DownloaderState>(
          builder: (context, state) {
            if (state is DownloadRunInProgress) {
              return Text("Download: ${state.value}");
            }
            if (state is DownloadPause) {
              return Text("Pause: ${state.value}");
            }
            return const Text("Done!");
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () {
                context
                    .read<DownloaderBloc>()
                    .add(const StartDownload(AppValue.url));
              },
            ),
            IconButton(
              onPressed: () {
                context.read<DownloaderBloc>().add(PauseDownload());
              },
              icon: const Icon(Icons.file_download_off),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.loop_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
