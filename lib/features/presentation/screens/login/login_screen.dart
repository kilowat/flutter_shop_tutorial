import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/widgets/logo.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).LOGIN),
      ),
      body: DefaultTabController(
        length: 2,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 480,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  _buildHeadTab(context),
                  _buildTabsItem(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildHeadTab(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(horizontal: Styles.paddingDefault),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Logo(),
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Welcome you!",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TabBar(
            labelColor: Styles.colorPrimary,
            labelStyle: TextStyle(fontSize: 16),
            indicatorColor: Styles.colorPrimary,
            unselectedLabelColor: Styles.colorLightText,
            tabs: [
              Tab(text: "Login"),
              Tab(text: "Register"),
            ],
          ),
        ],
      ),
    );
  }

  _buildTabsItem(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          LoginForm(),
          RegisterForm(),
        ],
      ),
    );
  }
}
