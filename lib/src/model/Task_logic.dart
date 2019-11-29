import 'package:pictron/src/model/tranfers/Task_page_transfer.dart';
import 'package:pictron/src/model/tranfers/Task_transfer.dart';

class TaskLogic {

factory TaskLogic() => _this ??= TaskLogic._();

TaskLogic._();

static TaskLogic _this;

// For easy access in the application
static TaskLogic get TaskL => _this;

/// This function is used as enter point to load a Task
/// TODO load the Task transfer from DAO class
TaskTransfer loadTask(int id) =>
    TaskTransfer(id: id, name: 'Prueba',
        list: <TaskPageTransfer>[
          TaskPageTransfer(id: 0, url: 'http://www.arasaac.org/temp/tmp85dn9f_9700.png'),
          TaskPageTransfer(id: 1,
              url: 'http://www.arasaac.org/temp/tmpaH4SM4_9.png'),
          TaskPageTransfer(id: 2, url: 'http://www.arasaac.org/temp/tmpmuz365_1433.png')]
    );
}