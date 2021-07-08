import 'package:flutter/material.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage(
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height / 3 - 40),
      width: size.width,
      child:
      Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        alignment: Alignment.center,
        height: 250,
        width: 250,
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                child: Text(
                  "There was an error while loading the app. Check if you have proper internet connection, then close and start the app again.",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                child: Text(
                  ":(",
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
