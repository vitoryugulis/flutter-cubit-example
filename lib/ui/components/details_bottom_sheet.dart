import 'package:flutter/material.dart';
import 'package:movielist/data/models/movie.dart';

class DetailsBottomSheet extends StatelessWidget {
  final String posterImage;
  final String title;
  final int year;
  final String synopsis;
  final id;
  final bool isMovie;
  const DetailsBottomSheet(
      this.title,
      this.id,
      this.isMovie,
      this.posterImage,
      this.synopsis,
      this.year,
      {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Color(0xFF424242),
      ),
      child: Column(
        children: [
          //Movie info
          Row(
            children: [
              Image.network(
                  posterImage,
                width: 110,
                height: 170,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                      ),
                      Container()
                    ],
                  ),
                  Row(
                    children: [
                      Text(year.toString()),
                    ],
                  ),
                  Text(synopsis)
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
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
                      "Watch",
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
                    "See more",
                    style: TextStyle(
                        fontSize: 12,
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
                    Icons.info_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "See more",
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
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 30,
              ),
              Text("See information"),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
