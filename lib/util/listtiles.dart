import 'package:flutter/material.dart';

class RoundedListTile extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final Color? color;

  const RoundedListTile({super.key, this.title, this.titleStyle, required this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            title != null ? Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Center(child: Text(title!, style: titleStyle ?? const TextStyle(fontSize: 30, color: Colors.black),))
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

  const ImageListTile({super.key, required this.image, required this.body, this.padding, this.onPressed});

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

