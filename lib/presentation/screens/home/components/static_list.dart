import 'package:flutter/material.dart';
import 'package:myapp/presentation/screens/home/components/isolate_item.dart';
import 'package:myapp/share/app_value.dart';

class StaticList extends StatelessWidget {
  const StaticList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: AppValue.urlList.length,
          itemBuilder: (_, index) {
            return IsolateItem(initUrl: AppValue.urlList[index].url);
          }),
    );
  }
}
