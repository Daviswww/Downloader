import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/infrastructure/hive/hive_repository.dart';
import 'package:myapp/infrastructure/hive/hive_repository_impl.dart';

class ImageDeleteButton extends StatefulWidget {
  const ImageDeleteButton({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  State<ImageDeleteButton> createState() => _ImageDeleteButtonState();
}

class _ImageDeleteButtonState extends State<ImageDeleteButton> {
  late HiveRepository hiveRepository;
  late ImageModel image;
  @override
  void initState() {
    hiveRepository = HiveRepositoryImpl();
    image = widget.image;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AutoRouter.of(context).pop();
        hiveRepository.delete(image);
      },
      child: const Text("Delete"),
    );
  }
}
