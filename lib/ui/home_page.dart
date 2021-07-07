import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';

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
    var highlight = homePageMovies.nowPlaying.first;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Series",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(width: 80,),
            Text(
              "Movies",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        )
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    //Movie highlight
                    Stack(
                      alignment: Alignment.bottomCenter,
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
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: highlight.genreIds!.map((id) {
                                return Text(
                                  _getGenreName(id)?? "-",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Minha lista",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  "Assistir",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  "Saiba mais",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
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
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
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
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
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
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
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
                          Padding(padding: EdgeInsets.only(bottom: 20)),
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
    );
  }

  String? _getGenreName(int genreId){
    return BlocProvider.of<GenresCubit>(context).genres!.firstWhere((element) => element.id == genreId).name;
  }
}
