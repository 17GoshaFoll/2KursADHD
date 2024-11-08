import 'Task.dart';

class Day{
  late List<Task> tasks;
  late double activity;

  Day(List<Task> tasks){
    this.tasks = tasks;
    activity = checkActivity();
  }

  double checkActivity(){
    var readyTasks = 0.0;
    for(var i = 0; i < tasks.length; i++){
      if (tasks[i].ready) readyTasks++;
    }
    return readyTasks /  tasks.length;
  }
}