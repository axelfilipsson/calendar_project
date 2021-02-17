import 'package:flutter/material.dart';

import 'calendar_table.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool newCalendarInputRow = false;
  bool newCalendarItemRow = false;
  bool buttonIcon = false;
  bool saveInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          if (buttonIcon)
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    newCalendarInputRow = !newCalendarInputRow;
                    newCalendarItemRow = !newCalendarItemRow;
                    saveInput = !saveInput;
                    buttonIcon = !buttonIcon;
                  });
                },
                child: Text(
                  "save",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.0),
                ),
              ),
            ),
        ],
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.grey[900],
      ),
      body: CustomCalendarTable(newCalendarInputRow, newCalendarItemRow),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 32),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              newCalendarInputRow = !newCalendarInputRow;
              buttonIcon = !buttonIcon;
            });
          },
          child: buttonIcon == false ? Icon(Icons.add) : Icon(Icons.remove),
        ),
      ),
    );
  }
}
