import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:discuzq/widgets/ui/ui.dart';
import 'package:discuzq/widgets/common/discuzText.dart';
import 'package:discuzq/utils/authHelper.dart';
import 'package:discuzq/providers/userProvider.dart';

class FloatLoginButton extends StatelessWidget {
  const FloatLoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<UserProvider>(
          builder: (BuildContext context, UserProvider user, Widget child) {
        if (user.hadLogined) {
          return const SizedBox();
        }
        return Center(
          child: SizedBox(
            width: 200,
            child: MaterialButton(
              color: DiscuzApp.themeOf(context).primaryColor,
              child: const DiscuzText('登录/注册', color: Colors.white),
              onPressed: () => AuthHelper.login(context: context),
            ),
          ),
        );
      });
}
