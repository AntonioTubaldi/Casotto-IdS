import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

import '../arguments/SceltaOrarioEventoArgs.dart';
import 'HomePage.dart';
import 'SceltaOrarioEvento.dart';

class SceltaDataEventoView extends StatefulWidget {
  const SceltaDataEventoView(
      {Key? key, required this.nome, required this.numeroMaxPartecipanti})
      : super(key: key);

  final String nome;
  final int numeroMaxPartecipanti;

  static const String routeName = "SceltaDataEvento";

  @override
  State<SceltaDataEventoView> createState() => _SceltaDataEventoViewState();
}

class _SceltaDataEventoViewState extends State<SceltaDataEventoView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  bool _isDaySelected = false;

  DateTime? selectedDate;

  Widget? mostraSelezione() {
    if (_isDaySelected) {
      return Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        child: RawMaterialButton(
          constraints: BoxConstraints.expand(width: 350, height: 50),
          fillColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () => {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SceltaOrarioEventoView.routeName,
              arguments: SceltaOrarioEventoArgs(
                  widget.nome, widget.numeroMaxPartecipanti, _selectedDate!),
              ModalRoute.withName(HomePage.routeName),
            ),
          },
          child: const Text(
            "Seleziona questa data",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      );
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                arguments: const HomePage(),
                ModalRoute.withName(HomePage.routeName),
              );
            },
            child: Text("HOME"),
          ),
          mostraSelezione()!
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Calendario'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: _focusedDate,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDate, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _isDaySelected = true;
              _selectedDate = selectedDay;
              _focusedDate = focusedDay;
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
          _focusedDate = focusedDay;
        },
      ),
    );
  }
}
