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
          TaskPageTransfer(id: 0, url: 'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzI2MTcucG5n'),
          TaskPageTransfer(id: 1,
              url: 'http://www.arasaac.org/temp/9574114363242_4578.png'),
          TaskPageTransfer(id: 2, url: 'http://www.arasaac.org/temp/9574114363242_4578.png')]
    );
}