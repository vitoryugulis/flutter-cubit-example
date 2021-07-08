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
            return CircularProgressIndicator();
          } else if (state is MovieLoading) {
            return CircularProgressIndicator();
          } else if (state is MovieDetailsLoaded) {
            var movie = state.data;
            return Container(
              padding: EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.only(top: 260),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title?? " - ",
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 5)),
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
                                          "Rating: " + movie.voteAverage.toString(),
                                          style: TextStyle(
                                              fontSize: 13.5,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 10)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: (){},
                                                child: Ink(
                                                  color: Colors.white,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width - 10,
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
                                        SizedBox(height: 8,),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: (){},
                                                child: Ink(
                                                  color: Color(0xFF212121),
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width - 10,
                                                    padding: EdgeInsets.only(left: 10, right: 16, top: 5, bottom: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.download_outlined,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                        Padding(padding: EdgeInsets.only(left: 10)),
                                                        Text(
                                                          "Download",
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
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      movie.overview?? " No overview available",
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Wrap(
                                      children: movie.genres!.map((e) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Chip(
                                            labelPadding: EdgeInsets.all(2.0),
                                            label: Text(
                                              e.name!,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            backgroundColor: Color(0xFF414141),
                                            elevation: 2.0,
                                            shadowColor: Colors.white.withOpacity(0.2),
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Row(
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
                                                "My list",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 60,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.thumb_up_alt_outlined,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "My list",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 60,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.share,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                "My list",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        movie.hasBackDropImage?
                        Container(
                          height: 250,
                          color: Colors.green,
                          child: Image.network(
                            movie.backdropImage,
                            fit: BoxFit.cover,
                          ),
                        ) :
                        Container(
                          height: 250,
                          color: Colors.green,
                          child: Image.asset(
                            Assets.defaultBackdrop,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.only(top: 15, left: 15),
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
                ],
              ),
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
