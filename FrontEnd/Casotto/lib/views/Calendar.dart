import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isDaySelected = false;

  Widget? mostraPrenotazioni() {
    if (_isDaySelected) {
      return ElevatedButton(
          onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllPrenotazioniView(
                              dataSelezionata: _selectedDay!,
                            )))
              },
          child: Text(
            "VISUALIZZA PRENOTAZIONI",
            style: TextStyle(fontSize: 25),
          ));
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    print("Giorno selezionato: " + _selectedDay.toString());
    print("Giorno focussato: " + _focusedDay.toString());
    return Scaffold(
      floatingActionButton: mostraPrenotazioni(),
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
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
              _isDaySelected = true;
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
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
