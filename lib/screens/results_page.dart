import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/db_test.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText, @required this.height, @required this.weight});
  final String bmiResult;
  final double height;
  final double weight;
  final String resultText;
  final String interpretation;


  final dbHelper = DatabaseHelper.instance;
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'Bob',
      DatabaseHelper.columnAge  : 35,
      DatabaseHelper.columnWeight  : this.weight,
      DatabaseHelper.columnHeight  : this.height,
      DatabaseHelper.columnResult  : this.bmiResult,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
          child: ReusableCard(
           colour: kActiveCardColour,
           cardChild: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget> [
               Text(
                 resultText.toUpperCase(),
                 style: kResultTextStyle,
               ),
               Text(
                 bmiResult,
                 style: kBMITextStyle,
               ),
               Text(
                 interpretation,
                 textAlign: TextAlign.center,
                 style: kBodyTextStyle,
               ),

            ],
           ),
          ),
          ),
          Expanded(
            child: RaisedButton.icon(
              onPressed: _insert,
              icon: Icon(
                Icons.save_alt_outlined,
                size: 25.0,
              ),
              label: Text('Save It',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              color: kBottomContainerColour,

            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      )
    );
  }
}
