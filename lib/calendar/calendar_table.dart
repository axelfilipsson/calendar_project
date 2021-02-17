import 'package:flutter/material.dart';
import 'package:simple_calendar/calendar/rows/input_row.dart';

import 'models/calendar_item.dart';
import 'models/calendar_item_list.dart';
import 'rows/header_row.dart';

class CustomCalendarTable extends StatefulWidget {
  final bool newCalendarInputRow;
  final bool newCalendarItemRow;
  CustomCalendarTable(this.newCalendarInputRow, this.newCalendarItemRow);
  @override
  CustomCalendarTableState createState() => CustomCalendarTableState();
}

class CustomCalendarTableState extends State<CustomCalendarTable> {
  final calendarItems = <CalendarItem>[];
  Widget build(BuildContext buildContext) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 50),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 550,
            child:
                // ListView(children: [
                // calendarHeader(context),
                Column(
              children: [
                headerRow(context),
                if (widget.newCalendarInputRow) CalendarInputRow(),
                Expanded(
                  child: CalendarItemList(calendarItems: <CalendarItem>[
                    CalendarItem("Mahr", 110303, 1300, "kod 3030"),
                  ]),
                ),
              ],
            ),
            // if (widget.newCalendarInputRow) calendarInputRow()
            // ]),
          ),
        ],
      ),
    );
  }
}
