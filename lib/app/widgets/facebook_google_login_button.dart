import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class FacebookGoogleLoginButton extends StatelessWidget {
  final Function onTap;
  final String iconUrl;
  final String title;

  const FacebookGoogleLoginButton(
      {Key key, @required this.onTap, @required this.iconUrl, @required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconUrl,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.headline5.copyWith(fontSize: getResponsiveFont(18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}