import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  @override
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.easeIn);
    _fontSizeAnimation.addListener(() => setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Q.' +
                  widget._questionNumber.toString() +
                  ': ' +
                  widget._question,
              style: TextStyle(
                  fontSize: _fontSizeAnimation.value * 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
