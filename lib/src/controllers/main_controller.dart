import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;
import 'package:pictron/src/model/tranfers/Task_transfer.dart';
import 'package:pictron/src/model/Task_logic.dart';
//import 'package:pictron/src/app.dart' show App;

class Con extends ControllerMVC {

  // Singelton
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy access in the application
  static Con get con => _this;

  static final TaskLogic _taskLogic = TaskLogic();

  TaskTransfer getTask() => _taskLogic.loadTask(0);
}

