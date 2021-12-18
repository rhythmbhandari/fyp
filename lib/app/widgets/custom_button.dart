import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double radius;

  const CustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.radius = 0.0,
    this.textColor = Colors.white,
    // this.backgroundColor = const Color(0xffEB2027)}
    this.backgroundColor,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: (backgroundColor != null) ? backgroundColor : Colors.black87,
        borderRadius: BorderRadius.circular(radius),),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>((backgroundColor != null)? backgroundColor: Colors.transparent),
          padding:
          MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(16)),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
