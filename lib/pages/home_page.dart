import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haul27/constants/app_colors.dart';

import '../constants/app_textstyles.dart';
import '../widgets/home/home_bottom_nav.dart';
import '../widgets/home/ride_list_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kGreyscaleLightWhite,
          title: const Text('home'),
          centerTitle: true,
          titleTextStyle: kSubHeader2,
        ),
        backgroundColor: kGreyscaleBGDark,
        bottomNavigationBar: HaulBottomNavWidget(
          onTap: (index) {},
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => const RidesListItemWidget(),
        ));
  }
}
