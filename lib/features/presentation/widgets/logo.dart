import 'package:flippy/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicWidth(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset("assets/images/logo.svg"),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flippy",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: Styles.fontLemon,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Online grocery shop",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
