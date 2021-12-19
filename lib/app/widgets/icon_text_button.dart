import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color titleColor;
  final Function onTap;

  IconTextButton({
    @required this.icon,
    @required this.title,
    @required this.onTap,
    this.iconColor = const Color(0xff2E368F),
    this.titleColor = const Color(0xff2E368F),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5.copyWith(color: titleColor),
            ),
          ],
        ),
      ),
    );
  }
}