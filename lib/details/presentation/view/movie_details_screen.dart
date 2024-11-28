import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_netflix_app/core/extensions/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_images.dart';
import '../../../home/domain/entities/tv_show_response.dart';

class MovieDetailsScreen extends StatelessWidget {
  final TvShowResponse movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar with slideshow
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 320.h,
            collapsedHeight: 65.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: SizedBox(
                height: 415.h,
                child: ImageSlideshow(
                  indicatorColor: AppColors.dark,
                  autoPlayInterval: 15000,
                  isLoop: false,
                  children: [
                    CachedNetworkImage(
                      placeholder: placeholder,
                      errorWidget: errorWidget,
                      height: 415.h,
                      imageUrl: movie.show.image.original,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Spacer after Slideshow
          SliverToBoxAdapter(
            child: SizedBox(height: 10.h),
          ),

          // Movie Title Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.show.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      SizedBox(width: 5.w),
                      Text(
                        movie.show.rating.average?.toString() ?? '0',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(
            child: SizedBox(height: 15.h),
          ),

          // Genres Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Wrap(
                spacing: 8.w,
                children: movie.show.genres
                    .map(
                      (genre) => Chip(
                        label: Text(
                          genre,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(
            child: SizedBox(height: 15.h),
          ),

          // Summary Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                movie.show.summary,
                style: context.displayMedium?.copyWith(fontSize: 16.sp),
              ).removeHtmlTags(),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(
            child: SizedBox(height: 15.h),
          ),

          // Schedule Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule:',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Day(s): ${movie.show.schedule.days.join(', ')}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    'Time: ${movie.show.schedule.time}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(
            child: SizedBox(height: 15.h),
          ),

          // Links Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Links:',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () async {
                      // if (await canLaunch(movie.show.officialSite)) {
                      //   await launch(movie.show.officialSite!);
                      // }
                    },
                    child: Text(
                      movie.show.officialSite ?? 'No official site available.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(
            child: SizedBox(height: 30.h),
          ),
        ],
      ),
    );
  }
}
