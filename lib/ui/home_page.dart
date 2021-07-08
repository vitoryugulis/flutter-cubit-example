import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movielist/assets.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/data/models/series.dart';
import 'package:movielist/styles.dart';
import 'package:movielist/ui/components/details_bottom_sheet.dart';
import 'package:movielist/ui/components/movie_carousel.dart';
import 'package:movielist/ui/components/series_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  AnimationController? _colorAnimationController;
  AnimationController? _textAnimationController;
  Animation? _colorTween;

  @override
  void initState() {
    super.initState();
    _buildAnimations();
    print(BlocProvider.of<MovieCubit>(context).homePageMovies!.latest.title);
    print(BlocProvider.of<MovieCubit>(context).homePageMovies!.popular.first.posterImage);
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController!.animateTo(scrollInfo.metrics.pixels / 350);

      _textAnimationController!.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    var homePageMovies = BlocProvider.of<MovieCubit>(context).homePageMovies!;
    var popular = homePageMovies.popular;
    var topRated = homePageMovies.topRated;
    var nowPlaying = homePageMovies.nowPlaying;
    var highlight = homePageMovies.nowPlaying.last;
    var homePageSeries = BlocProvider.of<SeriesCubit>(context).homePageSeries!;
    var popularSeries = homePageSeries.popular;
    var topRatedSeries = homePageSeries.topRated;
    var airingToday = homePageSeries.airingToday;
    var onTheAir = homePageSeries.onTheAir;
    //var upcoming = homePageMovies.upcoming;
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Series",
                  style: Fonts.homePageAppBar
                ),
                Text(
                  "Movies",
                  style: Fonts.homePageAppBar
                ),
                Text(
                  "My list",
                  style: Fonts.homePageAppBar
                )
              ],
            ),
          )
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: _scrollListener,
                child: Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          //Movie highlight
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image.network(
                                  highlight.posterImage,
                                  height: 580,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: _movieGenres(highlight.genreIds!),
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 10),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text(
                                              "My list",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Material(
                                                child: InkWell(
                                                  onTap: () => _showMovieDetails(highlight),
                                                  child: Ink(
                                                    color: Colors.white,
                                                    child: Container(
                                                      height: 36,
                                                      padding: EdgeInsets.only(right: 16, left: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                          Padding(padding: EdgeInsets.only(left: 8)),
                                                          Text(
                                                            "Watch",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                            SizedBox(height: 4,),
                                            Text(
                                              "See more",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.7),
                                        ],
                                        stops: [0.0, 1],
                                        begin: FractionalOffset.bottomCenter,
                                        end: FractionalOffset.topCenter,
                                    )
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Popular movies",
                                    style: Fonts.title,
                                  ),
                                ),
                                MovieCarousel(popular),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 20)),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Top rated movies",
                                    style: Fonts.title,
                                  ),
                                ),
                                //top rated
                                MovieCarousel(topRated),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 20)),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Now playing",
                                    style: Fonts.title,
                                  ),
                                ),
                                MovieCarousel(nowPlaying),
                                Padding(padding: EdgeInsets.only(bottom: 20)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Top rated series",
                                    style: Fonts.title,
                                  ),
                                ),
                                SeriesCarousel(topRatedSeries),
                                Padding(padding: EdgeInsets.only(bottom: 20)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Popular series",
                                    style: Fonts.title,
                                  ),
                                ),
                                SeriesCarousel(popularSeries),
                                Padding(padding: EdgeInsets.only(bottom: 20)),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Airing today",
                                    style: Fonts.title,
                                  ),
                                ),
                                SeriesCarousel(airingToday),
                                Padding(padding: EdgeInsets.only(bottom: 20)),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "On the air",
                                    style: Fonts.title,
                                  ),
                                ),
                                //top rated
                                SeriesCarousel(onTheAir),
                                Padding(padding: EdgeInsets.only(bottom: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 90,
                child: AnimatedBuilder(
                  animation: _colorAnimationController!,
                  builder: (context, child) => Container(
                    height: 90,
                    color: _colorTween!.value,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getGenreName(int genreId){
    return BlocProvider.of<GenresCubit>(context).genres!.firstWhere((element) => element.id == genreId).name;
  }

  _movieGenres(List<int> genreIds) {
    var index = 0;

    return genreIds.map((id) {
      var widget = Row(
        children: [
          Text(
            _getGenreName(id)?? "-",
            style: TextStyle(
                fontSize: 13.5,
                color: Colors.white
            ),
          ),
          if(genreIds.length > 1 && index < genreIds.length - 1)
            Container(
              margin: EdgeInsets.only(bottom: 3, left: 8, right: 8),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
              ),
            )
        ],
      );
      index += 1;
      return widget;
    }).toList();

  }

  void _showMovieDetails(Movie movie) {
    DetailsBottomSheet.show(
      context,
      DetailsBottomSheet(
          movie.title!,
          movie.id!,
          true,
          movie.posterImage,
          movie.overview!,
          DateFormat.y().format(DateTime.parse(movie.releaseDate?? "2020-01-01")),
          movie.hasPosterImage
      ),
    );
  }

  void _buildAnimations() {
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.black.withOpacity(0.7))
        .animate(_colorAnimationController!);

    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
  }
}
