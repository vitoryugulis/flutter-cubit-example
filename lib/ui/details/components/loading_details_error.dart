import 'package:flutter/material.dart';

class LoadingDetailsError extends StatelessWidget {
  final VoidCallback onTap;
  const LoadingDetailsError(
      this.onTap,
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
        alignment: Alignment.center,
        height: 250,
        width: 250,
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Material(
                      child: InkWell(
                        onTap: () => onTap,
                        child: Ink(
                          color: Colors.white,
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.only(right: 16, left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Text(
                                  "Reload",
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
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Material(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Ink(
                          color: Color(0xFF212121),
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.only(right: 16, left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Text(
                                  "Return",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
