import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/core/constants/assets_images.dart';
import 'package:flutter_netflix_app/core/extensions/text/app_text.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.summary,
  });

  final String thumbnail;
  final String title;
  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail with CachedNetworkImage
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: thumbnail,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: errorWidget,
          ),
        ),
        const SizedBox(height: 8),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Summary
        Text(
          summary,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).removeHtmlTags(),
      ],
    );
  }
}
