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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late AppLifecycleState appLifecycleState;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    final StreamController streamController =
        StreamController<AppLifecycleState>();
    streamController.stream.listen((event) {
      debugPrint(event);
    });
    appLifecycleState = AppLifecycleState.inactive;
    super.didChangeAppLifecycleState(appLifecycleState);

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.detached:
        debugPrint("Detached");
        break;
      case AppLifecycleState.inactive:
        debugPrint("Inactive");
        break;
      case AppLifecycleState.resumed:
        debugPrint("Resumed");
        break;
      case AppLifecycleState.paused:
        debugPrint("Paused");
        break;
      default:
    }
    appLifecycleState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
          IsolateItem(initUrl: AppValue.url),
        ],
      ),
    );
  }
}
