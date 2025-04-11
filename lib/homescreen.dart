import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

class home extends StatefulWidget {
  static const String id='home';
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
var userInput='';
var answer='';
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            BackdropFilter(filter:ImageFilter.blur(sigmaY: 20,sigmaX: 20
            ), child: Container(
                color:Colors.black,
            ),),

            SafeArea(
              child: Column(
                children: [

                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      height:60,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text(userInput.toString(),style: TextStyle(fontSize: 40,color: Colors.black),)),
                            SizedBox(height: 20,),
                            Text(answer.toString(),style: TextStyle(fontSize: 40,color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [

                        Row(
                          children: [

                            button(title:'AC',color:Color(0xffF57F17),onpress: (){
                              userInput='';
                              answer='';
                              setState((){});
                            },),
                            button(title:'+/-',color: Color(0xffF57F17),onpress: (){userInput+='+/-';
                            setState(() {

                            });
                            },),
                            button(title:'%',color: Color(0xffF57F17),onpress: (){
                              userInput+='%';
                              setState(() {

                              });
                            },),
                            button(title:'/',color: Color(0xffF57F17),onpress: (){
                              userInput+='/';
                              setState(() {

                              });
                            },),


                          ],
                        ),

                        Row(
                          children: [

                            button(title:'7',onpress: (){
                              userInput+='7';
                              setState(() {

                              });
                            },),
                            button(title:'8',onpress: (){
                              userInput+='8';
                              setState(() {

                              });
                            },),
                            button(title:'0',onpress: (){
                              userInput+='0';
                              setState(() {

                              });
                            },),
                            button(title:'*',onpress: (){
                              userInput+='*';
                              setState(() {

                              });
                            },),


                          ],
                        ),

                        Row(
                          children: [

                            button(title:'4',onpress: (){
                              userInput+='4';
                              setState(() {

                              });
                            },),
                            button(title:'5',onpress: (){
                              userInput+='5';
                              setState(() {

                              });
                            },),
                            button(title:'6',onpress: (){
                              userInput+='6';
                              setState(() {

                              });
                            },),
                            button(title:'-',onpress: (){
                              userInput+='-';
                              setState(() {

                              });
                            },),


                          ],
                        ),
                        Row(
                          children: [

                            button(title:'1',onpress: (){
                              userInput+='1';
                              setState(() {

                              });
                            },),
                            button(title:'2',onpress: (){
                              userInput+='2';
                              setState(() {

                              });
                            },),
                            button(title:'3',onpress: (){
                              userInput+='3';
                              setState(() {

                              });
                            },),
                            button(title:'+',onpress: (){
                              userInput+='+';
                              setState(() {

                              });
                            },),


                          ],
                        ),
                        Row(
                          children: [

                            button(title:'0',onpress: (){
                              userInput+='0';
                              setState(() {

                              });
                            },),
                            button(title:'.',onpress: (){
                              userInput+='.';
                              setState(() {

                              });
                            },),
                            button(title:'DEL',onpress: (){
                              userInput=userInput.substring(0,userInput.length -1);
                            },),
                            button(title:'=',onpress: (){
                              equalPress();

                              setState(() {

                              });},),


                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ],
              ),


            ),

          ],
        ),


      ),
    );

  }
  void equalPress(){
    String finalUserInput=userInput;

    Parser p=Parser();

    Expression expression=p.parse(finalUserInput);
    ContextModel contextModel=ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL, contextModel);
    answer=eval.toString();
  }
}

