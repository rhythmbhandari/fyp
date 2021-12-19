import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String title;
  final IconData icon;

  IconText({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black54,
        ),
        SizedBox(width: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2
              .copyWith(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}