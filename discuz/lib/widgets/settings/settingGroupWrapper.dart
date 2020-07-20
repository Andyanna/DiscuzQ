import 'package:flutter/material.dart';

import 'package:discuzq/widgets/ui/ui.dart';
import 'package:discuzq/widgets/common/discuzText.dart';

class SettingGroupWrapper extends StatelessWidget {
  final List<Widget> children;
  final String label;

  const SettingGroupWrapper({this.children, this.label = ''});

  @override
  Widget build(BuildContext context) {
    List<Widget> rebuildChildren = [...children];
    if (label != '') {
      rebuildChildren.insert(
          0,
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: DiscuzText(
                label,
                fontSize: DiscuzApp.themeOf(context).normalTextSize,
                color: DiscuzApp.themeOf(context).greyTextColor,
              )));
    }
    rebuildChildren.insert(0, const SizedBox(height: 10));

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: DiscuzApp.themeOf(context).backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rebuildChildren,
      ),
    );
  }
}
