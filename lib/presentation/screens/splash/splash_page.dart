import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/router/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    AutoRouter.of(context).replace(const Dashboard());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading"),
      ),
    );
  }
}
