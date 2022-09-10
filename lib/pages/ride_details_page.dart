import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';
import '../widgets/haul_button.dart';
import '../widgets/rideDetailPage/rider_list_tile.dart';

class RideDetailsPage extends StatelessWidget {
  const RideDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
          decoration: const BoxDecoration(
              color: kGreyscaleLightWhite,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _MainContent(),
              const SizedBox(height: 40),
              Text('Rider Status', style: kTextL),
              const SizedBox(height: 10),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const RiderListTile())
            ],
          ),
        ),
      ),
    );
  }
}

class _MainContent extends StatefulWidget {
  const _MainContent({super.key});

  @override
  State<_MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<_MainContent> {
  late PageController _controller;

  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 4,
                  controller: _controller,
                  onPageChanged: (_) {
                    setState(() {
                      _currentPage = _;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/img_placeholder.png',
                      height: 300,
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: kError,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                  children: List.generate(
                      2,
                      (index) => Container(
                            margin: const EdgeInsets.only(
                                top: 4, bottom: 4, right: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24),
                            decoration: BoxDecoration(
                                border: Border.all(color: kGreyscaleDivider),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'grand frondo',
                              style: kTextSBold,
                            ),
                          )).toList()),
              Text('Matheran Grand Frondo', style: kSubTitle2),
              const SizedBox(height: 10),
              Text(
                'Today is such a beautiful day. Let\'s hug!',
                style: kTextM,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HaulButton(child: const Text('Join'), onPressed: () {}),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: kAscentLightPrimary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '4 hours',
                        style: kTextM,
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.star_outline_rounded,
                        color: kSystemErrorAttention,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '4.9',
                        style: kTextM,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: List.generate(
              550 ~/ 10,
              (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                      height: 2,
                    ),
                  )),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: const Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset.zero,
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? kAscentLightPrimary : kGreyscaleLightWhite,
        ),
      ),
    );
  }
}
