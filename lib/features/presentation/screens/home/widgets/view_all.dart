import 'package:flippy/common/styles.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  final String title;
  final String route;
  const ViewAll({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Styles.paddingDefault),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).VIEW_ALL,
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
