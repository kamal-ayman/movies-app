import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_string.dart';

import '../../../../core/services/sevices_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';
import '../components/popular_and_top_rated_item_builder_components.dart';
import '../controller/movies/movies_bloc.dart';
import '../controller/movies/movies_event.dart';
import '../controller/movies/movies_state.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MoviesBloc>()..add(GetTopRatedMoviesEvent()),
      // lazy: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppString.topRatedMoviesAppBarTitle),
        ),
        body: const TopRatedScreenComponent(),
      ),
    );
  }
}

class TopRatedScreenComponent extends StatelessWidget {
  const TopRatedScreenComponent({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
      current.topRatedMoviesState != previous.topRatedMoviesState,
      builder: (context, state) {
        switch (state.topRatedMoviesState) {
          case RequestState.loading:
          return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return SingleChildScrollView(
              child: Column(
                children:
                state.topRatedMovies.map((Movie movie) =>
                    popularAndTopRatedItemBuilder(movie, context)).toList(),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.topRatedMoviesMessage));
        }
      },
    );
  }

}
