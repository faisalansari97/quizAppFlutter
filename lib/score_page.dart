import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final score;
  final totalquestion;

  ScorePage(this.score, this.totalquestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score:',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Text(score.toString() + '/' + totalquestion.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          IconButton(
            icon: new Icon(Icons.play_arrow),
            color: Colors.white,
            iconSize: 100,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => new LandingPage()),
                (Route route) => route == null),
          )
        ],
      ),
    );
  }
}
