import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {

  const ArrowButton({bool left = true, GestureTapCallback event,
        double height = 20, double width = 20, double margin = 0,
        double padding = 0, int flex = 1}):
        _arrowPath = left ? 'assets/left_arrow.png' : 'assets/right_arrow.png',
        _onTap = event,
        _height = height,
        _width = width,
        _margin = margin,
        _padding = padding,
        _flex = flex;


  final String _arrowPath;
  final GestureTapCallback _onTap;
  final double _height;
  final double _width;
  final double _margin;
  final double _padding;
  final int _flex;

  @override
  Widget build(BuildContext context) => Expanded(
    flex: _flex,
    child: Container(
      height: _height,
      width: _width,
      margin: EdgeInsets.all(_margin),
      padding: EdgeInsets.all(_padding),
      child: Ink.image(
          image: AssetImage(_arrowPath),
          fit: BoxFit.fill,
          child: InkWell(onTap: _onTap),
        ),
    ),
  );
}