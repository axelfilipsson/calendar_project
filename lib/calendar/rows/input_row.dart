import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarInputRow extends StatefulWidget {
  @override
  _CalendarInputRowState createState() => _CalendarInputRowState();
}

class _CalendarInputRowState extends State<CalendarInputRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[600],
              border: Border.all(color: Colors.grey[800]),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField("Activity"),
                customDateField("Date", context),
                customTimeField("Time", context),
                customTextField("Other"),
              ],
            ),
          )),
    );
  }

  Widget customTextField(title) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(hintText: title, isDense: true),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget customDateField(title, context) {
    return Expanded(
      child: MaterialButton(
        child: Text(
          "Date",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext builder) {
                return Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      backgroundColor: Theme.of(context).primaryColor,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newdate) {
                        print(DateTime.now());
                      },
                      minimumYear: 2021,
                      maximumYear: 2050,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.date,
                    ));
              });
        },
      ),
    );
  }

  Widget customTimeField(title, context) {
    String time;
    return Expanded(
      child: MaterialButton(
        child: Text(
          "time",
          // time == "" ? "Time" : time,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext builder) {
                return Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      backgroundColor: Theme.of(context).primaryColor,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          time = newTime.toString();
                        });
                        lastUpdatedGMTString(time);
                        print(time);
                      },
                      use24hFormat: true,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.time,
                    ));
              });
        },
      ),
    );
  }

  String lastUpdatedGMTString(time) => time.replaceAll(
      new RegExp(r'[0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]'), '');
}
