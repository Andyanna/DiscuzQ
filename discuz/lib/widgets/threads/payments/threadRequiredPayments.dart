import 'dart:io';

import 'package:discuzq/models/threadModel.dart';
import 'package:discuzq/utils/global.dart';
import 'package:discuzq/widgets/common/discuzButton.dart';
import 'package:discuzq/widgets/common/discuzIcon.dart';
import 'package:discuzq/widgets/common/discuzText.dart';
import 'package:discuzq/widgets/ui/ui.dart';
import 'package:discuzq/widgets/webview/webviewHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class ThreadRequiredPayments extends StatelessWidget {
  ///
  /// 关联主题
  ///
  final ThreadModel thread;

  const ThreadRequiredPayments({this.thread});

  String get _paymentLabel =>
      Platform.isIOS ? '包含受保护的内容，暂时无权限查看' : '该内容需要付费后才能浏览，请在网页端购买';

  @override
  Widget build(BuildContext context) {
    ///
    /// 已经支付，或者免费的内容则不提示
    if (thread.attributes.paid ||
        double.tryParse(thread.attributes.price) == 0) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: DiscuzApp.themeOf(context).scaffoldBackgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: DiscuzText(
              _paymentLabel,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          DiscuzButton(
            label: '了解详情',
            width: 140,
            height: 35,
            icon: const DiscuzIcon(
              SFSymbols.doc_text_search,
              color: Colors.white,
            ),
            onPressed: () {
              WebviewHelper.launchUrl(
                  url: '${Global.domain}/details/${thread.id.toString()}');
            },
          )
        ],
      ),
    );
  }
}