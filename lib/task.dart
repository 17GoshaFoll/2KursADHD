import 'dart:io';

class Task {
  late String _name;
  late DateTime _date;
  late int _priority;
  late String _category;
  late int _timeToTask;
  late String _description;
  late List<File> _attachments;
  late bool _ready;

  Task(
    this._name,
    this._date,
    this._priority,
    this._category,
    this._timeToTask,
    this._description,
    this._attachments, {
    bool ready = false,
  }) : _ready = ready;


  String get name => _name;
  DateTime get date => _date;
  int get priority => _priority;
  String get category => _category;
  int get timeToTask => _timeToTask;
  String get description => _description;
  List<File> get attachments => _attachments;
  bool get ready => _ready;

  set name(String name) {
    if (name.isEmpty) {
      throw ArgumentError("Task name cannot be empty");
    }
    _name = name;
  }

  set date(DateTime date) {
    _date = date;
  }

  set priority(int priority) {
    if (priority < 1 || priority > 5) {
      throw ArgumentError("Priority should be between 1 and 5");
    }
    _priority = priority;
  }

  set category(String category) {
    if (category.isEmpty) {
      throw ArgumentError("Category cannot be empty");
    }
    _category = category;
  }

  set timeToTask(int timeToTask) {
    if (timeToTask <= 0) {
      throw ArgumentError("Time to task should be greater than zero");
    }
    _timeToTask = timeToTask;
  }

  set description(String description) {
    if (description.isEmpty) {
      throw ArgumentError("Description cannot be empty");
    }
    _description = description;
  }

  set attachments(List<File> attachments) {
    if (attachments.isEmpty) {
      throw ArgumentError("Attachments cannot be empty");
    }
    _attachments = attachments;
  }

  set ready(bool ready) {
    _ready = ready;
  }

  addAttachments(File attachment){
    attachments.addAll(attachment as Iterable<File>);
  }

  taskIsDone(){
    ready = true;
  }
}