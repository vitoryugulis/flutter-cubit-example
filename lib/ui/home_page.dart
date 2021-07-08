import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/styles.dart';
import 'package:movielist/ui/components/details_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    print(BlocProvider.of<MovieCubit>(context).homePageMovies!.latest.title);
    print(BlocProvider.of<MovieCubit>(context).homePageMovies!.popular.first.posterImage);
  }

  @override
  Widget build(BuildContext context) {
    var homePageMovies = BlocProvider.of<MovieCubit>(context).homePageMovies!;
    var popular = homePageMovies.popular;
    var topRated = homePageMovies.topRated;
    //var upcoming = homePageMovies.upcoming;
    var nowPlaying = homePageMovies.nowPlaying;
    var highlight = homePageMovies.nowPlaying.last;
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 100,
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
              SingleChildScrollView(
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
                                              onTap: () => _showDetailsBottomSheet(highlight),
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
                                          size: 26,
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
                                      Colors.black.withOpacity(0.6),
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
                                "Popular",
                                style: Fonts.title,
                              ),
                            ),
                            //top rated
                            Container(
                              height: 160,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: popular.length,
                                itemBuilder: (context, index){
                                  var movie = popular[index];
                                  return GestureDetector(
                                    onTap: () => _showDetailsBottomSheet(movie),
                                    child: Container(
                                      height: 160,
                                      width: 115,
                                      margin: EdgeInsets.only(right: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                            movie.posterImage,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
                                "Top Rated",
                                style: Fonts.title,
                              ),
                            ),
                            //top rated
                            Container(
                              height: 160,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: topRated.length,
                                itemBuilder: (context, index){
                                  var movie = topRated[index];
                                  return GestureDetector(
                                    onTap: () => _showDetailsBottomSheet(movie),
                                    child: Container(
                                      height: 160,
                                      width: 115,
                                      margin: EdgeInsets.only(right: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                            movie.posterImage,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
                                "Now Playing",
                                style: Fonts.title,
                              ),
                            ),
                            //top rated
                            Container(
                              height: 160,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: nowPlaying.length,
                                itemBuilder: (context, index){
                                  var movie = nowPlaying[index];
                                  return GestureDetector(
                                    onTap: () => _showDetailsBottomSheet(movie),
                                    child: Container(
                                      height: 160,
                                      width: 115,
                                      margin: EdgeInsets.only(right: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                            movie.posterImage,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 60)),
                          ],
                        ),
                      ),
                    ],
                  ),
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

  void _showDetailsBottomSheet(Movie movie) {
    DetailsBottomSheet.show(
      context,
      DetailsBottomSheet(
          movie.title!,
          movie.id!,
          true,
          movie.posterImage,
          movie.overview!,
          //highlight.releaseDate!
          2020
      ),
    );
  }
}
//
// AnimationController? _ColorAnimationController;
// AnimationController? _TextAnimationController;
// Animation? _colorTween, _iconColorTween;
// Animation<Offset>? _transTween;
//
// @override
// void initState() {
//   super.initState();
//   _ColorAnimationController =
//       AnimationController(vsync: this, duration: Duration(seconds: 0));
//   _colorTween = ColorTween(begin: Colors.transparent, end: Color(0xFFee4c4f))
//       .animate(_ColorAnimationController!);
//   _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.white)
//       .animate(_ColorAnimationController!);
//
//
//   _TextAnimationController =
//       AnimationController(vsync: this, duration: Duration(seconds: 0));
//
//   _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
//       .animate(_TextAnimationController!);
// }
//
// bool _scrollListener(ScrollNotification scrollInfo) {
//   if (scrollInfo.metrics.axis == Axis.vertical) {
//     _ColorAnimationController!.animateTo(scrollInfo.metrics.pixels / 350);
//
//     _TextAnimationController!.animateTo(
//         (scrollInfo.metrics.pixels - 350) / 50);
//     return true;
//   }
//   return false;
// }