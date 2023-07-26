import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';

class ImageViewTitle extends StatelessWidget {
  const ImageViewTitle({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: Text(
        image.filename,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
