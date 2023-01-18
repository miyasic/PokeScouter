import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/text_style.dart';

class MyPageTile extends StatelessWidget {
  const MyPageTile(
      {Key? key,
      required this.title,
      required this.icons,
      required this.iconColor,
      this.trailing,
      this.style,
      required this.onTap})
      : super(key: key);
  final String title;
  final TextStyle? style;
  final IconData icons;
  final MaterialColor iconColor;
  final Function onTap;
  final Widget? trailing;

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        icons,
                        color: iconColor,
                      ),
                    ),
                    Text(title, style: style ?? textStylePlain),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: trailing == null
                      ? const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        )
                      : trailing!,
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
