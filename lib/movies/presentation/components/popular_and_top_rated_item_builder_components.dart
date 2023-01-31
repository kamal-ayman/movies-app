import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';
import '../controller/movie_detail/movie_detail_bloc.dart';
import '../screens/movie_detail_screen.dart';

Widget popularAndTopRatedItemBuilder(Movie movie, BuildContext context) {
  // print(movie.backdropPath);
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Card(
      color: Colors.grey.shade800,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(id: movie.id),
              ));
        },
        borderRadius: BorderRadius.circular(8),
        splashFactory: NoSplash.splashFactory,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  height: 120,
                  width: 90,
                  fit: BoxFit.cover,
                  imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              child: Text(movie.releaseDate),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                            size: 20,
                          ),
                          const SizedBox(width: 2),
                          Text(movie.voteAverage.toStringAsFixed(1)),
                        ],
                      ),
                    ),
                    Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}




