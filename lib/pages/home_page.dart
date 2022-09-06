import 'package:flutter/material.dart';
import '../widgets/home/ride_list_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemBuilder: (context, index) => const RidesListItemWidget(),
    ));
  }
}
