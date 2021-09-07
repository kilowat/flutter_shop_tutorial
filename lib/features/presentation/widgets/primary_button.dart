import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final bool isLight;

  const PrimaryButton({
    required this.text,
    required this.onPress,
    this.isLight = false,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        primary: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        onPress();
      },
      child: SizedBox(
        width: 284,
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: HSLColor.fromColor(Theme.of(context).primaryColor)
                      .withLightness(0.6)
                      .toColor(),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(Icons.arrow_forward_outlined),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
