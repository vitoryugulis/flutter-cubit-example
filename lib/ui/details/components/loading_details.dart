import 'package:flutter/material.dart';

class LoadingDetails extends StatelessWidget {
  const LoadingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height / 2 - 40),
      width: size.width,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        child: Container(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
