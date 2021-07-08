import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movielist/ui/assets.dart';
import 'package:movielist/data/models/series.dart';
import 'package:movielist/ui/home/components/details_bottom_sheet.dart';

class SeriesCarousel extends StatelessWidget {
  final List<Series> series;

  const SeriesCarousel(this.series,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: series.length,
        itemBuilder: (context, index) {
          var item = series[index];
          return GestureDetector(
            onTap: () => _showSeriesDetails(context, item),
            child: Container(
              height: 160,
              width: 110,
              margin: EdgeInsets.only(right: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: !item.hasPosterImage ?
                Image.asset(Assets.defaultPoster) :
                Image.network(
                    item.posterImage,
                    fit: BoxFit.cover
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSeriesDetails(BuildContext context, Series series) {
    print(series.firstAirDate);
    DetailsBottomSheet.show(
      context,
      DetailsBottomSheet(
          series.name!,
          series.id!,
          false,
          series.posterImage,
          series.overview!,
          //caso a data venha como string vazia do tmdb, efetua tratamento do dado
          series.firstAirDate != ""? DateFormat.y().format(DateTime.parse(series.firstAirDate!)) : series.firstAirDate?? " - ",
          series.hasPosterImage
      ),
    );
  }
}