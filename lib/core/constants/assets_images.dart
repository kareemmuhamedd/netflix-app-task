import 'package:flutter/material.dart';

abstract class AssetsImages {
  AssetsImages._();

  static const placeHolderImage = 'assets/images/placeholder.jpg';
  static const errorImage = 'assets/images/placeholder.jpg';
  static const placeHolderNetworkImage = 'https://wallpaperfx.com/view_image/walle-movie-1280x1024-wallpaper-2731.jpg';
}

Widget Function(BuildContext, String)? placeholder = (p0, p1) => Image.asset(
      AssetsImages.placeHolderImage,
      fit: BoxFit.cover,
    );

Widget Function(BuildContext, String, Object)? errorWidget =
    (p0, p1, p3) => Image.asset(
          AssetsImages.errorImage,
          fit: BoxFit.cover,
        );
