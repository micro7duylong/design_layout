import 'package:flutter/material.dart';

class AppleHealth extends StatefulWidget {
  const AppleHealth({super.key});

  @override
  State<AppleHealth> createState() => _AppleHealthState();
}

class _AppleHealthState extends State<AppleHealth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(children: [
          buildTitle(),
        ]),
      )),
    );
  }
}

Widget buildTitle() {
  return Container(
    child: Column(
      children: [
        Title(
          color: Colors.white,
          child: Text(
            'Apple Health',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Title(
          color: Colors.white,
          child: Text('Select one workout to sync with Liv3ly',
              style: TextStyle(fontSize: 10)),
        ),
      ],
    ),
  );
}

Widget buildListView() {
  return Container(
    child: ListView(),
  );
}
