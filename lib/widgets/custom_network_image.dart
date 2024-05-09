import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';

class CustomNetworkImage extends StatefulWidget {
  CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.scaleHeight,
    this.scaleWidth,
    this.placeholder,
    this.radius,
    this.tintColor,
    this.fit,
  });
  String? imageUrl;
  double? scaleHeight;
  double? scaleWidth;
  String? placeholder;
  BorderRadius? radius;
  Color? tintColor;
  BoxFit? fit;

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  void initState() {
    super.initState();
    widget.radius = (widget.radius != null) ? widget.radius : BorderRadius.zero;
    widget.scaleHeight =
        (widget.scaleHeight != null) ? widget.scaleHeight : 150.h;
    widget.scaleWidth = (widget.scaleWidth != null) ? widget.scaleWidth : 150.h;
    widget.fit = (widget.fit != null) ? widget.fit : BoxFit.cover;
  }

  @override
  Widget build(BuildContext context) {
    return (widget.imageUrl?.isNotEmpty ?? false)
        ? CachedNetworkImage(
            placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.radius,
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //       serviceLocator.iAppAssets?.errorPlaceholderImage ??
                    //           ""),
                    //   fit: fit,
                    // ),
                  ),
                  height: widget.scaleHeight,
                  width: widget.scaleWidth,
                  child: SvgPicture.asset(assetsConstants.noImagePlaceholder),
                ),
            fit: widget.fit,
            height: widget.scaleHeight,
            fadeInDuration: const Duration(seconds: 2),
            width: widget.scaleWidth,
            color: (widget.tintColor != null)
                ? widget.tintColor
                : colorsConstants.transparent,
            imageUrl: widget.imageUrl ?? "",
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.radius,
                    image:
                        DecorationImage(image: imageProvider, fit: widget.fit),
                  ),
                ),
            errorWidget: (context, url, error) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: widget.radius,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //       serviceLocator.iAppAssets?.errorPlaceholderImage ?? ""),
                  //   fit: fit,
                  // ),
                ),
                height: widget.scaleHeight,
                width: widget.scaleWidth,
                child: SvgPicture.asset(assetsConstants.noImagePlaceholder),
                // child: Image.asset(
                //   placeholder ??
                //       serviceLocator.iAppAssets?.errorPlaceholderImage ??
                //       "",
                //   fit: fit,
                //   height: scaleHeight,
                //   width: scaleWidth,
                // ),
              );
            })
        : Container(
            decoration: BoxDecoration(
              borderRadius: widget.radius,
              // image: DecorationImage(
              //   image: AssetImage(
              //       serviceLocator.iAppAssets?.errorPlaceholderImage ?? ""),
              //   fit: fit,
              // ),
            ),
            height: widget.scaleHeight,
            width: widget.scaleWidth,
            child: SvgPicture.asset(assetsConstants.noImagePlaceholder),
          );
    //  Image.asset(
    //     placeholder ?? serviceLocator.iAppAssets?.errorPlaceholderImage ?? "",
    //     fit: fit,
    //     height: scaleHeight,
    //     width: scaleWidth,
    //   );
  }
}
