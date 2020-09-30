import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/5.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Have A Nice Time!'),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()),
          ),
        ),
      ),
    );
  }
}
