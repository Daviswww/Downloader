import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/presentation/router/app_router.gr.dart';
import 'package:myapp/share/app_hive_box.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.image,
    required this.index,
  });

  final int index;
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          context.pushRoute(
            ViewerPage(
              index: index,
            ),
          );
        },
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage("${AppHiveBox.dir}/${image.filename}"),
        ),
      ),
    );
  }
}
