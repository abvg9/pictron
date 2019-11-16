import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;

//import 'package:pictron/src/app.dart' show App;

class Con extends ControllerMVC {
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy access in the application
  static Con get con => _this;

  //static final model = Model();
}
