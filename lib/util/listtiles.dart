import 'package:flutter/material.dart';

class RoundedListTile extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final Color? color;

  RoundedListTile({this.title, this.titleStyle, required this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            title != null ? Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Center(child: Text(title!, style: const TextStyle(fontSize: 30, color: Colors.white),))
            ):const SizedBox(),
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

