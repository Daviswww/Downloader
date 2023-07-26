import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/share/app_hive_box.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Image(
            height: 100,
            width: 100,
            fit: BoxFit.fill,
            image: AssetImage("${AppHiveBox.dir}/${image.filename}"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    image.filename,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(image.url),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
