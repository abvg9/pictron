import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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



/// This class is used in order to warp a two buttons code
class PasswordTwoButtons {
  int _firstButtonTaps = 0;
  int _secondButtonTaps = 0;

  void resetCode(){
    _firstButtonTaps = 0;
    _secondButtonTaps = 0;
  }

  /// It's used to finish the story.
  /// Secret code:
  ///     1: 2 taps on the first(top/left) secret button
  ///     2: 1 taps on the second(top/right) secret button
  void tapSecretCode({int id}) {
    if (id == 1){
      if(_firstButtonTaps < 2){
        _firstButtonTaps++;
      }
      else {
        _firstButtonTaps = 0;
        _secondButtonTaps = 0;
      }
    }
    else if(id == 2){
      if(_firstButtonTaps != 2){
        _secondButtonTaps = 0;
        _firstButtonTaps = 0;
      }
      else {
        _secondButtonTaps++;
      }
    }

    /// Code accepted
    if(_firstButtonTaps == 2 && _secondButtonTaps == 1){
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

}