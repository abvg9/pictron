import 'package:flutter/material.dart';
import 'package:pictron/src/widget/visibility.dart';
import 'package:pictron/src/widget/visibility.dart' as vi;

class ArrowButton extends StatelessWidget {

  const ArrowButton({bool left = true, GestureTapCallback event,
        double height = 20, double width = 20, double margin = 0,
        double padding = 0, int flex = 1,
        VisibilityFlag visibility = VisibilityFlag.visible}):
        _arrowPath = left ? 'assets/left_arrow.png' : 'assets/right_arrow.png',
        _onTap = event,
        _height = height,
        _width = width,
        _margin = margin,
        _padding = padding,
        _flex = flex,
        _visibility = visibility;


  final String _arrowPath;
  final GestureTapCallback _onTap;
  final double _height;
  final double _width;
  final double _margin;
  final double _padding;
  final int _flex;
  final VisibilityFlag _visibility;

  @override
  Widget build(BuildContext context) => Expanded(
      flex: _flex,
      child: vi.Visibility(
        visibility: _visibility,
        child:Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.all(_margin),
          padding: EdgeInsets.all(_padding),
          child: Ink.image(
              image: AssetImage(
                  _visibility == VisibilityFlag.visible ? _arrowPath : ''),
              fit: BoxFit.fill,
              child: InkWell(onTap: _onTap),
            ),
        ),
    ),
  );
}