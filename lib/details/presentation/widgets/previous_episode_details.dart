import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/core/extensions/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_images.dart';
import '../../domain/entities/episode.dart';

class PreviousEpisodeDetails extends StatelessWidget {
  const PreviousEpisodeDetails({
    super.key,
    required this.previousEpisode,
  });

  final EpisodeEntity? previousEpisode;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Above the Image
            Text(
              "Previous Episode",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),

            Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 270.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    width: 120.w,
                    // Set a specific width for the image
                    height: 200.h,
                    imageUrl: previousEpisode?.image?.original! ?? '',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),
            Text(
              "Season ${previousEpisode?.season}, Episode ${previousEpisode?.number}: ${previousEpisode?.name}",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(Icons.date_range, color: Colors.red, size: 16.sp),
                SizedBox(width: 5.w),
                Text(
                  "Air Date: ${previousEpisode?.airdate}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.red, size: 16.sp),
                SizedBox(width: 5.w),
                Text(
                  "Air Time: ${previousEpisode?.airtime}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.timer, color: Colors.red, size: 16.sp),
                SizedBox(width: 5.w),
                Text(
                  "Runtime: ${previousEpisode?.runtime} mins",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              previousEpisode?.summary ?? "No description available.",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[300],
                height: 1.4,
              ),
            ).removeHtmlTags(),
          ],
        ),
      ),
    );
  }
}
