
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function clickCallback;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? buttonHeight;
  final double? buttonWidth;
  final BorderRadiusGeometry? radius;
  final Gradient? gradient;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.clickCallback,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.buttonHeight,
    this.buttonWidth,
    this.fontWeight,
    this.radius,
    this.borderColor,
    this.borderWidth,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 48,
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (gradient != null)
              ? null
              : bgColor ?? primaryButtonColor,
          padding: (gradient != null) ? EdgeInsets.all(0) : null,
          shadowColor: primaryButtonColor.withOpacity(0.4),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(18),
            side: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? transparent,
            ),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: radius ?? BorderRadius.circular(48),
              gradient: gradient ?? null),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? primaryButtonTextColor,
                    fontSize: fontSize ?? 12.0,
                    fontWeight: fontWeight ?? FontWeight.w500,
                  ),
                ),
              ),
            ]),
          ),
        ),
        onPressed: () {
          clickCallback();
        },
      ),
    );
  }
}
