import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movielist/ui/assets.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/ui/home/components/details_bottom_sheet.dart';

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MovieCarousel(
      this.movies,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var item = movies[index];
          return GestureDetector(
            onTap: () => _showMovieDetails(context, item),
            child: Container(
              height: 160,
              width: 110,
              margin: EdgeInsets.only(right: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: !item.hasPosterImage ?
                Image.asset(Assets.defaultPoster) :
                Image.network(
                    item.posterImage,
                    fit: BoxFit.cover
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showMovieDetails(BuildContext context, Movie movie) {
    DetailsBottomSheet.show(
      context,
      DetailsBottomSheet(
          movie.title!,
          movie.id!,
          true,
          movie.posterImage,
          movie.overview!,
          //caso a data venha como string vazia do tmdb, efetua tratamento do dado
          movie.releaseDate != ""? DateFormat.y().format(DateTime.parse(movie.releaseDate!)) : movie.releaseDate?? " - ",
          movie.hasPosterImage
      ),
    );
  }
}