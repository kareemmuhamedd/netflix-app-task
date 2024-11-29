import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/search/presentation/widgets/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/debouncer.dart';
import '../bloc/search_bloc.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Debouncer debouncer;

  const SearchAppBar({super.key, required this.debouncer});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<SearchBloc>()
                      .add(const SearchLoadTvShows(''));
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SearchField(
                  onChanged: (query) {
                    debouncer.run(
                      () {
                        if (query.isEmpty) {
                          context
                              .read<SearchBloc>()
                              .add(const SearchLoadTvShows(''));
                        } else {
                          context
                              .read<SearchBloc>()
                              .add(SearchLoadTvShows(query));
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
