import 'package:flutter/material.dart';
import 'package:myapp/utils/config/config_reader.dart';
import 'package:myapp/utils/config/environment.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/presentation/router/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppRouter appRouter = AppRouter();
  await ConfigReader.initializeApp(Environment.dev);
  await Hive.initFlutter();
  Hive.registerAdapter(ImageModelAdapter());
  await Hive.openBox<ImageModel>('imageBox');
  await Hive.openBox('env');
  final box = Hive.box('env');
  final dir = await getApplicationDocumentsDirectory();
  box.put('dir', dir.path);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;

  const MyApp({
    Key? key,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: ConfigReader.config().debug,
      routerConfig: _appRouter.config(),
    );
  }
}
