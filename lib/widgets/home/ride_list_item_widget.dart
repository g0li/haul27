import 'package:flutter/material.dart';
import 'package:haul27/constants/app_colors.dart';
import 'package:haul27/widgets/haul_button.dart';

import '../../constants/app_textstyles.dart';
import '../../pages/ride_details_page.dart';

class RidesListItemWidget extends StatelessWidget {
  const RidesListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RideDetailsPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
            color: kGreyscaleLightWhite,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: const [
                  _ImagePagerWidget(),
                  _FavouriteButton(),
                  _DistanceIndicator(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const _ParticipantsWidget(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Umberkhind Grand Frondo',
                    style: kSubTitle2,
                  ),
                ),
                HaulButton(child: const Text('join'), onPressed: () {})
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

final _colors = [
  Colors.amber,
  Colors.deepPurple,
  Colors.green,
  Colors.cyan,
  Colors.white
];

class _ParticipantsWidget extends StatelessWidget {
  const _ParticipantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Stack(
          children: List.generate(
              _colors.length,
              (index) => Container(
                    height: 32,
                    width: 32,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: index * 16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: _colors[index]),
                    child: index == 4
                        ? Text(
                            '+1',
                            style: kTextXSmallBold,
                          )
                        : const SizedBox.shrink(),
                  ))),
    );
  }
}

class _DistanceIndicator extends StatelessWidget {
  const _DistanceIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      right: 20,
      child: Container(
          height: 25,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kGreyscaleLightDisabledBG),
          child: Text(
            '100 km',
            style: kButtonSmall.copyWith(color: kGreyscaleLightDisabledText),
          )),
    );
  }
}

class _FavouriteButton extends StatefulWidget {
  const _FavouriteButton({super.key});

  @override
  State<_FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<_FavouriteButton> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        splashRadius: 20,
        onPressed: () {
          setState(() {
            _isActive = !_isActive;
          });
        },
        icon: Icon(_isActive ? Icons.favorite : Icons.favorite_border_outlined),
        color: kError,
      ),
    );
  }
}

class _ImagePagerWidget extends StatefulWidget {
  const _ImagePagerWidget({super.key});

  @override
  State<_ImagePagerWidget> createState() => _ImagePagerWidgetState();
}

class _ImagePagerWidgetState extends State<_ImagePagerWidget> {
  late PageController _controller;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
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
        )
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
