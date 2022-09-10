import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_textstyles.dart';

class RiderListTile extends StatelessWidget {
  const RiderListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Umesh', style: kTextMBold),
      subtitle: Text('78km', style: kTextM),
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(child: Image.asset('assets/profile.png')),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
              ),
            )
          ],
        ),
      ),
      trailing: Text('19:57', style: kTextXSmallBold),
      children: [
        Container(
          color: const Color(0xFFFFECE1),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                'assets/img_placeholder.png',
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last updated at 16:00 am',
                    style: kTextXSmallBold,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '5km away from you',
                    style: kTextMBold,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '10%',
                            style: kTextMBold,
                          ),
                          Container(
                            height: 10,
                            width: 120,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: kGreyscaleDivider,
                                borderRadius: BorderRadius.circular(8)),
                            child:
                                LayoutBuilder(builder: (context, constraint) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 10,
                                    width: constraint.maxWidth * .1,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(8)),
                                        color: kAscentLightPrimary),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                      Text(
                        '5/50 KM',
                        style: kTextMBold,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
