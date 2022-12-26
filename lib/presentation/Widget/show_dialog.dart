import 'package:flutter/material.dart';

/// ダイアログ
Future<void> showTextDialog(
  BuildContext context, {
  required String title,
  String? message,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SelectableText(
          title,
        ),
        content: message != null
            ? SelectableText(
                message,
              )
            : null,
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showConfirmDialog({
  required BuildContext context,
  required String title,
  String? message,
  required String okText,
  String cancelText = 'やめとく。',
  required Function function,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: SelectableText(
          title,
        ),
        content: message != null
            ? SelectableText(
                message,
              )
            : null,
        actions: [
          TextButton(
            child: Text(
              cancelText,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              okText,
            ),
            onPressed: () async {
              await function();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
