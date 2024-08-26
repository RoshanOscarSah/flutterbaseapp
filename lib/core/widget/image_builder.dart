import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../config/color.dart';
import '../widget/loading_animation.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;
  final bool circular;

  const ImageBuilder({
    super.key,
    this.imageUrl = "",
    this.imagePath,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.circular = false,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (imageUrl.isNotEmpty) {
      child = CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return const Center(child: LoadingHexa());
        },
        errorWidget: (context, url, error) {
          return const Center(
              child: Icon(Icons.hide_image_outlined, color: CusColor.kP100));
        },
      );
    } else if (imagePath != null) {
      child = Image.asset(
        width: width,
        height: height,
        imagePath!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: LoadingHexa());
        },
      );
    } else {
      SizedBox(
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
        borderRadius: BorderRadius.circular(borderRadius!),
        child: child,
      );
    }

    return child;
  }
}
