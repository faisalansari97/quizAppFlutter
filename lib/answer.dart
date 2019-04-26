import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  bool answer;
  final VoidCallback _onTap;

  AnswerButton(this.answer, this._onTap);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: this.answer == true ? Colors.lightGreen : Colors.red,
        child: new InkWell(
          onTap: () => _onTap(),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5.0)),
              padding: EdgeInsets.all(10),
              child: Text(
                this.answer == true ? 'True' : 'False',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
