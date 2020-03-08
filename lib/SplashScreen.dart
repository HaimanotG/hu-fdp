import 'package:flutter/material.dart';
import 'package:fresh_dorm/CustomPainter.dart';

class SplashScreen extends StatelessWidget {
  final Color firstColor = Color(0xFFF47D15);
  final Color secondColor = Color(0xFFEF772C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CustomColorPainter(firstColor, secondColor),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset('images/hu_logo.png'),
                ),
              ),
              Text(
                'Fresh Dormitary\n    Placement',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
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
