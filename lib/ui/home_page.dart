

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';

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
    var upcoming = homePageMovies.upcoming;
    var highlight = homePageMovies.nowPlaying.first;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  //Movie highlight
                  Container(
                    height: 560,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(highlight.posterImage), fit: BoxFit.cover)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: highlight.genreIds!.map((e) {
                            return Text(
                              e.toString(),
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
                  ),
                  //top rated
                  Container(),
                  //upcoming
                  Container(),
                  //popular
                  Container(),
                ],
              ),
            ),
          ),
          // CustomScrollView(
          //   slivers: <Widget>[
          //     SliverAppBar(
          //       floating: true,
          //       title: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Séries"),
          //           Text("Filmes"),
          //           Text("Minha Lista")
          //         ],
          //       ),
          //       backgroundColor: Colors.transparent,
          //       collapsedHeight: 30,
          //       toolbarHeight: 30,
          //       expandedHeight: 80.0,
          //       flexibleSpace: FlexibleSpaceBar(
          //         background: Container(
          //           color: Colors.transparent,
          //         )
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
