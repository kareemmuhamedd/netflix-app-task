import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_netflix_app/core/constants/assets_images.dart';
import 'package:flutter_netflix_app/home/domain/entities/tv_show_response.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  children: List.generate(
                    1,
                    (image) {
                      return CachedNetworkImage(
                        placeholder: placeholder,
                        errorWidget: errorWidget,
                        height: 415.h,
                        imageUrl: movie.show.image.original,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
