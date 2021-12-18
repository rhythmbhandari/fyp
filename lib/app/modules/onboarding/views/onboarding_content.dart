import 'package:flutter/material.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class OnBoardingContent extends StatelessWidget {
  final String heading;
  final String content;
  final String imageUrl;

  OnBoardingContent(
      {Key key, @required this.heading,
        @required this.content,
        @required this.imageUrl}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(height: getResponsiveFont(16)),
            Text(
              heading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: getResponsiveFont(30),
              ),
            ),
            SizedBox(height: getResponsiveFont(16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(content,
                  textAlign: TextAlign.center,
                  style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: getResponsiveFont(16))),
            ),
          ],
        ),
      ),
    );
  }
}
