import 'package:flutter/material.dart';

class RoundedListTile extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget body;
  final Color? color;

  RoundedListTile({required this.title, this.titleStyle, required this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 30, color: Colors.white),),
          ),
          body
        ],
      ),
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String image;
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  ImageListTile({required this.image, required this.body, this.padding, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(image),
            ),
            body,
          ],
        ),
      ),
    );
  }
}

