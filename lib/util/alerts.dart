import 'package:flutter/material.dart';

void alert({required BuildContext context, required String title, Widget? message, List<Widget>? actions}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(title),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: message,
            actions: actions,
          );
        }
      )
  );
}

class AlertButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final VoidCallback? onPressed;

  const AlertButton({super.key, required this.title, this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {
        Navigator.pop(context);
      },
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0,
            color: textColor
        ),
      ),
    );
  }
}