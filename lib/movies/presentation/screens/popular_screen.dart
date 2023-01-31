import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_string.dart';

import '../../../core/services/sevices_locator.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies/movies_bloc.dart';
import '../controller/movies/movies_event.dart';
import '../controller/movies/movies_state.dart';
import '../components/popular_and_top_rated_item_builder_components.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      lazy: true,
      child: Scaffold(
        appBar: AppBar(title: const Text(AppString.popularMoviesAppBarTitle)),
        body: const PopularComponentsScreen(),
      ),
    );
  }
}

class PopularComponentsScreen extends StatelessWidget {
  const PopularComponentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
      previous.popularMoviesState != current.popularMoviesState,
      builder: (context, state) {
        switch (state.popularMoviesState){
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return SingleChildScrollView(
              child: Column(
                children: state.popularMovies.map((Movie movie) => popularAndTopRatedItemBuilder(movie, context)).toList(),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.popularMoviesMessage));
        }
      },
    );
  }
}

