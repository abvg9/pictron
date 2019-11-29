import 'package:pictron/src/model/tranfers/Task_page_transfer.dart';

class TaskTransfer {

  TaskTransfer({int id, String name, List<TaskPageTransfer> list}):
        taskId = id,
        names = name,
        pag = list;

  int taskId;
  String names;
  List<TaskPageTransfer> pag;
  int currentP = 0;
}
