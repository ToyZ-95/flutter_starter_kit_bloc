import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.title,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.onTap,
    this.alignment,
    this.boxDecoration,
    this.backgroundColor,
    this.borderRadius,
    this.titleStyle,
  });

  final String? title;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final AlignmentGeometry? alignment;
  final BoxDecoration? boxDecoration;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? double.maxFinite,
        alignment: alignment ?? Alignment.center,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 10.h,
            ),
        margin: margin,
        decoration: boxDecoration ??
            BoxDecoration(
              color: backgroundColor ?? colorsConstants.linkBlue,
              borderRadius:
                  borderRadius ?? BorderRadius.all(Radius.circular(5.r)),
            ),
        child: child ??
            Text(
              title ?? "",
              style: titleStyle ??
                  TextStyle(
                    color: colorsConstants.whiteColor,
                  ),
            ),
      ),
    );
  }
}
