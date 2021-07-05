

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    BlocProvider.of<MovieCubit>(context).getLatest().then((value) {
      print(value.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
