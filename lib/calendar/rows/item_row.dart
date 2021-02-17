import 'package:flutter/material.dart';
import 'package:simple_calendar/calendar/models/calendar_item.dart';

class ItemRow extends StatelessWidget {
  final CalendarItem calendarItem;

  const ItemRow({Key key, this.calendarItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(calendarItem.activity),
              customText(calendarItem.date.toString()),
              customText(calendarItem.time.toString()),
              customText(calendarItem.other),
            ],
          ),
        ));
  }
}

Widget customText(title) {
  return Expanded(
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
