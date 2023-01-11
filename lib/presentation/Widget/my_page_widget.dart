import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/text_style.dart';

class MyPageTile extends StatelessWidget {
  const MyPageTile(
      {Key? key,
      required this.title,
      this.selectedLabel = '',
      required this.icons,
      required this.iconColor,
      required this.onTap})
      : super(key: key);
  final String title;
  final String selectedLabel;
  final IconData icons;
  final MaterialColor iconColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: iconColor.shade50,
                      child: Icon(
                        icons,
                        color: iconColor,
                      ),
                    ),
                    Text(title, style: textStylePlain),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
