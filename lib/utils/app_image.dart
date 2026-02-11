import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final String? placeholderAsset;
  final String? errorAsset;
  final bool showLoading;

  const AppImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.placeholderAsset,
    this.errorAsset = 'assets/images/broken_image.png', // Ensure you have a default error asset or null
    this.showLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if it's a network image or local asset based on url pattern if needed, 
    // but here we focus on network images mainly.
    // Use CachedNetworkImage
    
    Widget imageWidget = CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => showLoading
          ? Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          : (placeholderAsset != null
              ? Image.asset(
                  placeholderAsset!,
                  width: width,
                  height: height,
                  fit: fit,
                )
              : const SizedBox()),
      errorWidget: (context, url, error) => errorAsset != null
          ? Image.asset(
              errorAsset!,
              width: width,
              height: height,
              fit: fit,
            )
          : const Icon(Icons.error),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
