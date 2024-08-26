import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/widget/loading_animation.dart';

class SvgBuilder extends StatelessWidget {
  final String svgUrl;
  final String svgPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final bool circular;
  final Color? color; // Allow color to be null

  const SvgBuilder({
    super.key,
    this.svgUrl = "",
    this.svgPath = "",
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.color,
    this.circular = false,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (svgUrl.isNotEmpty) {
      child = CachedNetworkSVGImage(
        svgUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.fitHeight,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null, // Apply only if color is not null
        placeholder: SizedBox(
          width: width,
          height: height,
          child: const Center(child: LoadingHexa()),
        ),
        errorWidget: SizedBox(
          width: width,
          height: height,
          child: const Center(
              child: Icon(Icons.hide_image_outlined, color: CusColor.kY200)),
        ),
      );
    } else if (svgPath.isNotEmpty) {
      child = SvgPicture.asset(
        svgPath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null, // Apply only if color is not null
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
        child: const Center(child: LoadingHexa()),
      );
    }

    if (circular) {
      child = ClipOval(
        child: child,
      );
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }
}
