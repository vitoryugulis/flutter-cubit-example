import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/styles.dart';

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
                                          size: 36,
                                        ),
                                        Text(
                                          "Minha lista",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 40),
                                      padding: EdgeInsets.only(left: 10, right: 16, top: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Colors.black,
                                            size: 28,
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 10)),
                                          Text(
                                            "Assistir",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          "Saiba mais",
                                          style: TextStyle(
                                              fontSize: 12,
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
                                  return Container(
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
                                  return Container(
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
                                  return Container(
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
                fontSize: 15,
                color: Colors.white
            ),
          ),
          if(genreIds.length > 1 && index < genreIds.length - 1)
            Container(
              margin: EdgeInsets.only(bottom: 3, left: 5, right: 5),
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
}
