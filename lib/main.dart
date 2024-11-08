import 'package:flutter/widgets.dart';
import 'Task.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Utils.dart';


String selectedDayTime = "${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}";

void main()
{ 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp(
      title: 'Fitness app',
      home: const MyHomePage(title: 'fitness app home'),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int index = 0;

class _MyHomePageState extends State<MyHomePage> 
{

   @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F9),
        title: const Text('Главная'),
         titleTextStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 24)
      ),
      body:
        ListView.separated(
        itemBuilder: (context, i)=> 
        ListTile(
       
        ), 
       separatorBuilder: (context, index) => const Divider(color: Colors.white),
        itemCount: 5),
        
        
        bottomNavigationBar: BottomNavigationBar(
         onTap: (int index){Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableBasicsExample (),));},
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Домашняя страница',
            backgroundColor: Color.fromARGB(214, 204, 230, 7)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Кликер',
             backgroundColor: Color.fromARGB(214, 204, 230, 7)
          ),
          BottomNavigationBarItem(
            icon: (Icon(Icons.access_alarm)),
            
            label: 'Календарь',
             backgroundColor: Color.fromARGB(214, 204, 230, 7),
             
          ),
        ],
        )
    );

    
  }
}




class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      body: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: const CalendarStyle(
          selectedDecoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle,),
          todayDecoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)
          ),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              selectedDayTime = "${selectedDay.year}.${selectedDay.month}.${selectedDay.day}";
              //if (!testTime.foods.containsKey(selectedDayTime)) testTime.createNewDay(selectedDayTime);
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}


