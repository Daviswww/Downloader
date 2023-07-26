import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/router/app_router.gr.dart';

@RoutePage()
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomePage(),
        HistoryPage(),
        PhotoPage(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'History',
                  icon: Icon(
                    Icons.history_edu_rounded,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Photo',
                  icon: Icon(
                    Icons.photo_outlined,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
