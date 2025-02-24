import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_image_error_widget.dart';
import 'app_image_loading_widget.dart';

const kSizeImageCache = 1080;

class AppImageWidget extends StatelessWidget {
  const AppImageWidget(
      {Key? key, required this.url, this.width = 54, this.height = 54})
      : super(key: key);
  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final baseImageUrl = dotenv.get('BASE_IMAGE_URL');

    return CachedNetworkImage(
      key: ValueKey(url),
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: '$baseImageUrl$url',
      maxWidthDiskCache: kSizeImageCache,
      memCacheWidth: kSizeImageCache,
      // cacheKey: url,
      placeholder: (BuildContext context, url) => const AppImageLoadingWidget(),
      errorWidget: (BuildContext context, url, err) => AppImageErrorWidget(
        width: width,
        height: height,
      ),
    );
  }
}
