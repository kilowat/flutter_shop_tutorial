import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text("Or login with social media"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 94,
                icon: SvgPicture.asset(
                  'assets/icons/Google.svg',
                ),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 94,
                icon: SvgPicture.asset(
                  'assets/icons/FB.svg',
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
