import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {

  const ArrowButton({bool left}): _isLeft = left;
  final bool _isLeft;

  @override
  _ArrowButtonState createState() => _ArrowButtonState(left: _isLeft);
}

class _ArrowButtonState extends State<ArrowButton> {

  _ArrowButtonState({bool left}):
        _arrowPath = left ? 'assets/left_arrow.png' : 'assets/right_arrow.png';

  //bool _isDisabled = false;
  final String _arrowPath;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Ink.image(
          image: AssetImage(_arrowPath),
          fit: BoxFit.fill,
          child: const InkWell(onTap: null),
        ),
      ),
    ),
  );
}