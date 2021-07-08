import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/ui/assets.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage(
      this.movieId,
      {Key? key}
  ) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieCubit>(context).getById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ),
      body:  BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {
          if (state is MovieError) {
            Container(
              child: Text("Error"),
            );
          }
        },
        builder: (context, state) {
          if (state is MovieInitial) {
            return Container();
          } else if (state is MovieLoading) {
            return Container();
          } else if (state is MovieDetailsLoaded) {
            var movie = state.data;
            return Stack(
              children: [
                Container(
                  height: 250,
                  color: Colors.green,
                  child: Image.network(
                    movie.hasBackDropImage? movie.backdropImage : Assets.defaultBackdrop,
                    fit: BoxFit.cover,
                  ),
                ),

                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Text(
                          movie.title?? " - ",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              movie.releaseDate != ""? DateFormat.y().format(DateTime.parse(movie.releaseDate!)) : movie.releaseDate?? " - ",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.grey
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 3, left: 8, right: 8),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Text(
                              movie.runtime.toString() + " min",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){},
                                child: Ink(
                                  color: Colors.white,
                                  child: Container(
                                    width: 180,
                                    padding: EdgeInsets.only(left: 10, right: 16, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 10)),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){},
                                child: Ink(
                                  color: Color(0xFF212121),
                                  child: Container(
                                    width: 180,
                                    padding: EdgeInsets.only(left: 10, right: 16, top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 10)),
                                        Text(
                                          "Watch",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
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
                        Text(
                          movie.overview?? " No overview available",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );

          } else {
            // (state is WeatherError)
            return CircularProgressIndicator();
          }
        },
      ),

    );
  }
}
