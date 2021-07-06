

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

    BlocProvider.of<MovieCubit>(context).getHomePageMovies().then((value) {
      print(value.latest.title);
    });
    BlocProvider.of<SeriesCubit>(context).getHomePageSeries().then((value) {
      print(value.latest.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
