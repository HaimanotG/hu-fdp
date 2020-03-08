import 'package:flutter/material.dart';
import 'package:fresh_dorm/CustomPainter.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color firstColor = Color(0xFFF47D15);
    final Color secondColor = Color(0xFFEF772C);

    return Scaffold(
      body: CustomPaint(
        painter: CustomColorPainter(firstColor, secondColor),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'By: Haimanot Getu \nhaimanotgetu18@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
