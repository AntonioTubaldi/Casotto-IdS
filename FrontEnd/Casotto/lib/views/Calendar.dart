import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class CalendarView extends StatefulWidget {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllPrenotazioniView(
                                  dataSelezionata: _selectedDate!,
                                )))
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

 //-- CALENDARIO STILE APPLE --

  //scegli una data da prenotare
  /* void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != selectedDate)
                  setState(() {
                    selectedDate = value;
                  });
              },
              initialDateTime: _focusedDate,
              minimumYear: 2022,
              maximumYear: 2023,
              use24hFormat: true,
            ),
          );
        });
  }*/

  /* void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate,
                        onDateTimeChanged: (val) {
                          setState(() {
                            selectedDate = val;
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }*/

//selezioni l'orario della prenotazione
 /* void _showTimePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _focusedDate,
                      onDateTimeChanged: (val) {
                        setState(() {
                          selectedDate = val;
                        });
                      },
                      use24hFormat: true,
                    ),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }*/

 /* Container(
            margin: EdgeInsets.all(40),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Scegli una data"),
                  onPressed: () {
                    _showDatePicker(context);
                  },
                ),
                ElevatedButton(
                  child: Text("Scegli un orario"),
                  onPressed: () {
                    _showTimePicker(context);
                  },
                ),
                Text(selectedDate == null ? "" : "$selectedDate"),
                ElevatedButton(
                  child: Text("Visualizza Prenotazioni"),
                  onPressed: () {
                    mostraPrenotazioni();
                  },
                ),
              ],
            )));
  }
}*/