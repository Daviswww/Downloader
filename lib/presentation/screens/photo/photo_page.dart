import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/presentation/screens/photo/components/image_item.dart';
import 'package:myapp/share/app_hive_box.dart';

@RoutePage()
class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late Box box;

  @override
  void initState() {
    box = AppHiveBox.imageBox;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  final datas = value.values.toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: value.values.length,
                    itemBuilder: (_, index) {
                      final image = datas[index] as ImageModel;
                      return ImageItem(
                        index: index,
                        image: image,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
