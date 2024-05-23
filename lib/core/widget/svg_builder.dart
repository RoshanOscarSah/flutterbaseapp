import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../config/color.dart';

class SvgBuilder extends StatelessWidget {
  final String svgUrl;
  final String svgAssets;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool circular;

  const SvgBuilder({
    super.key,
    this.svgUrl = "",
    this.svgAssets = "",
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.circular = false,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (svgUrl.isNotEmpty) {
      child = CachedNetworkSVGImage(svgUrl,
          width: width,
          height: height,
          fit: BoxFit.fitHeight,
          placeholder: const Center(child: CupertinoActivityIndicator()),
          errorWidget: const Center(
              child: Icon(Icons.hide_image_outlined, color: kY100)));
    } else if (svgAssets != "") {
      child = SvgPicture.asset(
        svgAssets,
        width: width,
        height: height,
      );
    } else {
      SizedBox(
        width: width,
        height: height,
        child: const Center(child: CupertinoActivityIndicator()),
      );
    }

    if (circular) {
      child = ClipOval(
        child: child,
      );
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child,
      );
    }

    return child;
  }
}
