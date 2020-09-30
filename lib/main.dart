import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'effect_problems.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.pink[100],
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Smart People Learn From Their Mistakes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFF6FA27),
                  ),
                ),
              ),
              flexibleSpace: Image(
                image: AssetImage('images/4.jpg'),
                fit: BoxFit.cover,
              ),
              // backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
                child: Center(
              child: CheckboxWidget(),
            ))));
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  int value = 0;

  @override
  void initState() {
    super.initState();
  }

  Map<String, bool> values = {
    'Relationship Broken': false,
    'Home Conflict': false,
    'Loss of Someone': false,
    'Jobless': false,
    'Rape or Sexual Abuse': false,
    'Cling into Something': false,
  };
  var tmpArray = [];
  getCheckboxItems() {
    values.forEach((key, values) {
      if (values == true) {
        tmpArray.add(key);
      }
    });
    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.
    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              subtitle: Text('Is this your problems!'),
              value: values[key],
              activeColor: Colors.deepOrange,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  values[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
      RaisedButton(
        color: Colors.deepOrange,
        child: Text(
          "Comfirm",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EffectProblem()));
        },
      ),
    ]);
  }
}
