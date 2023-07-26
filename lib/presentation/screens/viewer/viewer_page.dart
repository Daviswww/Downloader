import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/presentation/screens/viewer/components/image_view.dart';
import 'package:myapp/share/app_hive_box.dart';

@RoutePage()
class ViewerPage extends StatefulWidget {
  const ViewerPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  late int index;
  late List box;
  late PageController pageController;
  @override
  void initState() {
    index = widget.index;
    box = AppHiveBox.imageBox.values.toList();
    pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Viewer"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: AppHiveBox.imageBox.length,
        itemBuilder: (context, index) {
          final image = box[index] as ImageModel;
          return ImageView(
            image: image,
          );
        },
      ),
    );
  }
}
