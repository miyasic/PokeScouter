import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/text_style.dart';

import '../../constants/route_path.dart';

class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(kPageNameUpdate),
        ),
        body: Center(
          child: Text(
            "ストアで最新のアプリに更新してください。",
            style: textStyleGreyPlain,
          ),
        ));
  }
}
