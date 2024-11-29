import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_netflix_app/core/extensions/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_images.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../home/domain/entities/tv_show_response.dart';
import '../bloc/movie_details_bloc.dart';
import '../widgets/previous_episode_details.dart';

class MovieDetailsScreen extends StatelessWidget {
  final TvShowResponse movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MovieDetailsBloc>(),
      child: MovieDetailsView(movie: movie),
    );
  }
}

class MovieDetailsView extends StatefulWidget {
  final TvShowResponse movie;

  const MovieDetailsView({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    final previousEpisode = widget.movie.show.links.previousEpisode;

    if (previousEpisode != null && previousEpisode.href.isNotEmpty) {
      context.read<MovieDetailsBloc>().add(
            MovieDetailsEpisodeLoad(
              url: previousEpisode.href,
            ),
          );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final previousEpisode = context.select(
      (MovieDetailsBloc bloc) => bloc.state.episodes,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageSlideshow(
                indicatorColor: Colors.red,
                autoPlayInterval: 8000,
                isLoop: true,
                children: [
                  CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: widget.movie.show.image.original,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.show.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.red, size: 18.sp),
                      SizedBox(width: 5.w),
                      Text(
                        widget.movie.show.rating.average?.toString() ?? 'N/A',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Wrap(
                    spacing: 8.w,
                    children: widget.movie.show.genres
                        .map(
                          (genre) => Chip(
                            label: Text(
                              genre,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            backgroundColor: Colors.red.withOpacity(0.8),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    widget.movie.show.summary,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[300],
                      height: 1.4,
                    ),
                  ).removeHtmlTags(),
                ],
              ),
            ),
          ),
          if (previousEpisode != null)
            PreviousEpisodeDetails(previousEpisode: previousEpisode),
        ],
      ),
    );
  }
}
