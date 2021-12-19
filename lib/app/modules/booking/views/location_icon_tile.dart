import 'package:flutter/material.dart';

class LocationIconTile extends StatelessWidget {
  
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  LocationIconTile({@required this.title, @required this.icon, this.iconColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 16),
        Expanded(
                  child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 12, color: textColor),
          ),
        ),
      ],
    );
  }
}