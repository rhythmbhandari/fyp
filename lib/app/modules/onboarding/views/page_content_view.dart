import 'package:flutter/material.dart';

import './onboarding_content.dart';

class PageContentView extends StatelessWidget {
  final Function onPageChanged;
  final PageController pageController;

  const PageContentView({Key key, this.onPageChanged, this.pageController}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: onPageChanged,
      controller: pageController,
      children: <Widget>[
        OnBoardingContent(
          heading: 'Select Destination',
          content: 'Taxi, Bike, Tempo, Parcel, Food whichever you feel comfortable',
          imageUrl: 'assets/images/onboard2.png',
        ),
        OnBoardingContent(
          heading: 'Fast Response',
          content: 'How far is my rider? Estimated rider time and distance are displayed.',
          imageUrl: 'assets/images/onboard3.png',
        ),
        OnBoardingContent(
          heading: 'Enjoy The Ride',
          content: '“Life is for service.” – Fred Rogers',
          imageUrl: 'assets/images/onboard1.png',
        ),
      ],
    );
  }
}
