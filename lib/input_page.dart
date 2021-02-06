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
 int height = 180;
 int weight = 60;
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
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                   SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                       inactiveTrackColor: Color(0xFF8D8E98),
                       activeTrackColor: Colors.white,
                       thumbColor: Color(0xFFEB1555),
                       overlayColor: Color(0x15EB1555),
                       thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                       overlayShape: 
                            RoundSliderOverlayShape(overlayRadius: 30.0)
                     ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         RoundIconButton(
                           icon: FontAwesomeIcons.minus,
                         onPressed: (){
                           setState(() {
                             weight--;
                           });
                         },
                         ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),


                    ],
                  ),
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

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


