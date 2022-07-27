import 'package:casotto/arguments/AllPrenotazioniViewArgs.dart';
import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class CalendarView extends StatefulWidget {
  static const String routeName = "Calendar";
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  bool _isDaySelected = false;

  DateTime? selectedDate;

  Widget? mostraPrenotazioni() {
    if (_isDaySelected) {
      return Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          child: ElevatedButton(
              onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      AllPrenotazioniView.routeName,
                      arguments: AllPrenotazioniViewArgs(_selectedDate!),
                    ),
                  },
              child: const Text(
                "VISUALIZZA PRENOTAZIONI",
                style: TextStyle(fontSize: 25),
              )));
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    print("Giorno selezionato: ${_selectedDate.toString()}");
    print("Giorno individuato: ${_focusedDate.toString()}");
    return Scaffold(
        floatingActionButton: mostraPrenotazioni(),
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
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
        ));
  }
}
