import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/screens/home/components/header_item.dart';
import 'package:myapp/presentation/screens/home/components/isolate_item.dart';
import 'package:myapp/share/app_value.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLifecycleState appLifecycleState;
  late StreamController<AppLifecycleState> appLifecycleStream;
  @override
  void initState() {
    appLifecycleStream = StreamController<AppLifecycleState>();
    appLifecycleState = AppLifecycleState.inactive;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: const Column(
        children: [
          HeaderItem(initUrl: AppValue.url),
          // IsolateItem(initUrl: AppValue.url),
          // Item(),
        ],
      ),
    );
  }
}
