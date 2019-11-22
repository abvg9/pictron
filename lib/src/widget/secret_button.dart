import 'package:flutter/material.dart';

class SecretButton extends StatelessWidget {

  const SecretButton({GestureTapCallback event, int flex = 1}):
        _onTap = event,
        _flex = flex;

  final GestureTapCallback _onTap;
  final int _flex;

  @override
  Widget build(BuildContext context) => Expanded(
    flex: _flex,
    child: FlatButton(
      onPressed: _onTap,
      child: const Text(''),
    ),
  );
}