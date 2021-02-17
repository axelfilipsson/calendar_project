import 'package:flutter/material.dart';
import 'package:simple_calendar/calendar/rows/item_row.dart';

import 'calendar_item.dart';

class CalendarItemList extends StatefulWidget {
  const CalendarItemList({Key key, this.calendarItems}) : super(key: key);

  final List<CalendarItem> calendarItems;

  @override
  _CalendarItemListState createState() => _CalendarItemListState();
}

class _CalendarItemListState extends State<CalendarItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.calendarItems.map((CalendarItem calendarItem) {
        return ItemRow(calendarItem: calendarItem);
      }).toList(),
    );
  }
}
