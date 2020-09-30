import 'package:flutter/material.dart';
import 'next.dart';
import 'main.dart';

class EffectProblem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EffectProblemState();
}

class _EffectProblemState extends State<EffectProblem> {
  double _volume = 0.0;
  int _value = 1;

  final List<EffectEntry> _effectList = <EffectEntry>[
    const EffectEntry(' Sleep Problem', ''),
    const EffectEntry(' OveruseAlcohol', ''),
    const EffectEntry(' Loneliness ', ''),
    const EffectEntry(' Overwhemled ', ''),
    const EffectEntry('Easily Angry', ''),
    const EffectEntry('ConstantWorrying', ''),
    const EffectEntry('Mood Swings', ''),
    const EffectEntry('SexDrivesChange', ''),
    const EffectEntry(' Sad Or Down', ''),
    const EffectEntry('SuicidalThoughts', ''),
    const EffectEntry('Overuse Drug', ''),
    const EffectEntry('Loss Of Appitite', ''),
    const EffectEntry('Unfocus', ''),
    const EffectEntry('Weight Loss or Gain', ''),
  ];

  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (EffectEntry effect in _effectList) {
      yield Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FilterChip(
          backgroundColor: Colors.green,
          // avatar: CircleAvatar(child: Text(actor.initials,style: TextStyle(color: Colors.white))),
          label: Text(effect.name),
          selected: _filters.contains(effect.name),
          onSelected: (value) {
            setState(() {
              if (value) {
                _filters.add(effect.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == effect.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: new AppBar(
          title: new Text('Smart People Learn From Their Mistakes'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: actorWidgets.toList(),
            ),
            SizedBox(height: 50),
            // Text('Your chooses are : ${_filters.join(', ')}'),
            SizedBox(height: 50),
            ActionChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.green)),
                backgroundColor: Colors.blue,
                label: Text('Comfirm'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NextPage()));
                  // print("Do you want to start again");
                }),
          ],
        )));
  }
}

class EffectEntry {
  const EffectEntry(this.name, this.initials);
  final String name;
  final String initials;
}
