import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/widgets/logo.dart';
import 'package:flippy/features/presentation/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class StepTutorial extends StatelessWidget {
  final String title;
  final String description;
  final String picture;
  final PrimaryButton? button;
  StepTutorial(
      {required this.title,
      required this.description,
      required this.picture,
      this.button});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mPadding = MediaQuery.of(context).padding;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IntrinsicWidth(
            child: Padding(
                padding: EdgeInsets.only(top: mPadding.top), child: Logo()),
          ),
          SvgPicture.asset(
            picture,
            fit: BoxFit.contain,
            width: size.width,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Styles.colorLightText,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              if (button != null) button!,
            ],
          )
        ],
      ),
    );
  }
}
