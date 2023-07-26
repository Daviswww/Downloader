import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/presentation/screens/history/components/history_item.dart';
import 'package:myapp/share/app_hive_box.dart';

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                  return ListView.builder(
                    itemCount: value.values.length,
                    itemBuilder: (_, index) {
                      final image = datas[index] as ImageModel;
                      return HistoryItem(image: image);
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
