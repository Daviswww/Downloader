import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/infrastructure/hive/hive_repository.dart';
import 'package:myapp/infrastructure/hive/hive_repository_impl.dart';
import 'package:myapp/presentation/screens/viewer/components/image_delete_button.dart';
import 'package:myapp/presentation/screens/viewer/components/image_view_title.dart';
import 'package:myapp/share/app_hive_box.dart';

class ImageView extends StatefulWidget {
  const ImageView({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ImageViewTitle(image: image),
          Image(
            height: 300,
            fit: BoxFit.cover,
            image: AssetImage("${AppHiveBox.dir}/${image.filename}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Url:\n${image.url}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Path:\n${AppHiveBox.dir}/${image.filename}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageDeleteButton(image: image),
            ],
          )
        ],
      ),
    );
  }
}
