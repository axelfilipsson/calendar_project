import 'package:flutter/material.dart';

Widget headerRow(context) {
  return Container(
      margin: EdgeInsets.only(top: 20),
      height: 40,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField("Activity"),
            customTextField("Date"),
            customTextField("Time"),
            customTextField("Other")
          ],
        ),
      ));
}

Widget customTextField(title) {
  return Expanded(
    child: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
