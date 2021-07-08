import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Color(0xFF212121),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [

            //Movie info
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        posterImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                year.toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Container(
                            height: 100,
                            child: Text(
                              synopsis,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 4,),
            Container(
              padding: EdgeInsets.only(right: 30, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Material(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.download_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      Text(
                        "Download",
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
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
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
              ),
            ),
            SizedBox(height: 10,),
            Divider(
              height: 3,
              color: Color(0xFF424242),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 8,),
                  Text(
                    "Episodes and information",
                    style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static show(BuildContext context, DetailsBottomSheet bottomSheet){
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 300),
      context: context,
      builder: (context) => bottomSheet
    );
  }
}