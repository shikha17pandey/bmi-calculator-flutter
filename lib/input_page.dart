import 'package:flutter/cupertino.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  // Color maleCardColour = inactiveCardColor;
  // Color femaleCardColour = inactiveCardColor;
  //
  // //1= male, 2= female.
  // void updateColour(Gender selectedGender){
  //   if(selectedGender ==Gender.male){
  //     if(maleCardColour ==inactiveCardColor){
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColor;
  //     } else {
  //       maleCardColour = inactiveCardColor;
  //     }
  //   }
  //   // female card pressed
  //   if(selectedGender ==Gender.female){
  //     if(femaleCardColour ==inactiveCardColor){
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColor;
  //     } else {
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center
          (
            child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    selectedGender = Gender.male;
                  },
                   colour: selectedGender == Gender.male ? kActiveCardColour: kInactiveCardColor,
                   cardChild: IconContent(
                     icon: FontAwesomeIcons.mars,
                     label: 'MALE',
                   ),
                 ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    selectedGender = Gender.female;
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColour: kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        '180',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                ),
              ),
            ],
          ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      )
    );
  }
}



