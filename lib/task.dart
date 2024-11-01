import 'dart:io';

class Task{
  late String name;
  late int date;
  late int priority;
  late String category;
  late int timeToTask;
  late String description;
  late List<File> attachments;
  late bool ready;
  Task(String name, int date, int priority, String category, int timeToTask, String description, List<File> attachment){
    this.name = name;
    this.date = date;
    this.priority = priority;
    this.category = category;
    this.timeToTask = timeToTask;
    this.description = description;
    this.attachment = attachment;
    ready = false;
  }
  
  set attachment(List<File> attachment) {}

  setName(String name){
    this.name = name;
  }

  setDate(int date){
    this.date = date;
  }

  setPriority(int priority){
    this.priority = priority;
  }

  setCategory(String category){
    this.category = category;
  }

  setTimeToTask(int timeToTask){
    this.timeToTask = timeToTask;
  }

  setDescription(String description){
    this.description = description;
  }

  addAttachments(File attachment){
    attachments.addAll(attachment as Iterable<File>);
  }

  taskIsDone(){
    ready = true;
  }
}