import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'board.dart';
import 'roller.dart';


class KitchenTimer extends StatefulWidget {
  @override
  _KitchenTimerState createState() => _KitchenTimerState();
}

class _KitchenTimerState extends State<KitchenTimer> {
  static AudioCache player = AudioCache();
  bool _run = false;
  double _dy = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-160;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Material(
          child: Center(
            child: SizedBox(
              width: 250.0,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 128.0, right: 13.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(32, 33, 36, 1),
                          width: 5
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(32, 33, 36, 1),
                              blurRadius: 1
                          )
                        ]
                      ),
                      child: CustomPaint(
                        size: Size(double.infinity, height),
                        painter: Board(),
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 128.0, right: 13.0),
                    child: Container(
                      width: double.infinity,
                      height: _dy,
                      color: Color.fromRGBO(176, 0, 32, 0.2),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, _dy),
                    child: GestureDetector(
                      onVerticalDragUpdate: (details){
                        _dy = details.globalPosition.dy-80;
                        if(_dy > height+5) _dy = height+5;
                        if(_dy < 0) _dy = 0;
                        setState(() {});
                      },
                      onVerticalDragEnd: (details){
                        if(!_run && _dy == 0) return;
                        if(_run) return;
                        else _run = true;
                        Timer.periodic(Duration(microseconds: (3600000000/(height)).round()), (Timer timer){
                          _dy--;
                          if(_dy < 0) _dy = 0;
                          if(_dy == 0) {
                            player.play('alarm.mp3');
                            timer.cancel();
                            _run = false;
                          }
                          setState(() {});
                        });
                      },
                      child: CustomPaint(
                        size: Size(250.0, 30.0),
                        painter: Roller(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
