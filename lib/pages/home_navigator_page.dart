import 'package:flutter/material.dart';
import 'package:haul27/pages/you_page.dart';

import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';
import '../widgets/home/home_bottom_nav.dart';
import 'home_page.dart';

class HomeNavigatorPage extends StatelessWidget {
  const HomeNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreyscaleLightWhite,
        title: const Text('haul27'),
        centerTitle: true,
        titleTextStyle: kSubHeader2,
      ),
      backgroundColor: kGreyscaleBGDark,
      bottomNavigationBar: HaulBottomNavWidget(
        onTap: (index) {
          switch (index) {
            case 0:
              if (ModalRoute.of(rootNavigatorKey.currentState!.context)!
                      .settings
                      .name !=
                  'home') {
                Navigator.of(rootNavigatorKey.currentState!.context)
                    .pushNamed('home');
              }
              break;
            case 2:
              if (ModalRoute.of(rootNavigatorKey.currentState!.context)!
                      .settings
                      .name !=
                  'you') {
                Navigator.of(rootNavigatorKey.currentState!.context)
                    .pushNamed('you');
              }
              break;
            default:
          }
        },
      ),
      body: Navigator(
        key: rootNavigatorKey,
        initialRoute: 'home',
        onGenerateRoute: ((settings) {
          late Widget widget;
          switch (settings.name) {
            case 'home':
              widget = const HomePage();
              break;
            case 'you':
              widget = const YouPage();
              break;
            default:
              widget = const SizedBox.shrink();
          }
          return MaterialPageRoute(builder: (context) => widget);
        }),
      ),
    );
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
