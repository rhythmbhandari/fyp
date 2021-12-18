import 'package:flutter/material.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class PhoneLoginButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color backgroundColor;

  const PhoneLoginButton({Key key, @required this.onPressed, @required this.title, this.backgroundColor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        backgroundColor:
        MaterialStateProperty.all<Color>((backgroundColor != null)? backgroundColor : Theme.of(context).primaryColor),
      ),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white, fontSize: getResponsiveFont(18))),
    );
  }
}
