
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = '';
  String output1 = '';
  double num1;
  double num2;
  String operand;

  Widget _buildbutton(String text, Color _buttonColor, Color textColor){

    return FlatButton(
      onPressed: (){
        output = output + text;
        if(output.contains('/') || output.contains('X')|| output.contains('+') ||
        output.contains('-')){
          operand = text;
          num1 = double.parse((output.substring(0, output.length-1)));
          output = '0';
          print(num1);
          print(output);
        }
        else{
          print(output);
        }
        if(output.startsWith('0') && output.endsWith('=')){
          num2 = double.parse((output.substring(1,output.length-1)));
          print(num2);
          //output = (num2).toString();
        }
        if(output.contains('=')){
          if(operand == 'X'){
            output = (num1*num2).toString();
          }
          else if(operand == '/'){
            output = (num1/num2).toString();
          }
          else if(operand == '+'){
            output = (num1+num2).toString();
          }
          else if(operand == '-'){
            output = (num1-num2).toString();
          }
        }
        if(text == 'C'){
          num1 = 0;
          num2 = 0;
          operand = '';
          output = '';
        }
        setState(() {
          output1 = output;
        });

        //print(output);


      },
      color: _buttonColor,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'JosefinSans'
              ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(60.0),
                child: Text('$output1',
                style: TextStyle(
                  fontSize: 30.0,
                ),),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){},

                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'HISTORY',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                             // fontFamily: 'JosefinSans'
                          ),
                        ),
                      ),
                    ),

                  ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       alignment: Alignment.centerLeft,
                       child: FlatButton.icon(onPressed: (){}, icon: Icon(
                          Icons.screen_rotation,
                        color: Colors.blue[900],),
                            label: Text(" ")),
                     ),
                   ),

                    Container(
                      
                        padding: EdgeInsets.only(left: 20.0),
                        child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.cancel, color: Colors.blue[900]), label: Text(" ")))
                ],
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildbutton('C', Colors.grey[100], Colors.blue[900]),
                        _buildbutton('7', Colors.white, Colors.black),
                        _buildbutton('4', Colors.white, Colors.black),
                        _buildbutton('1', Colors.white, Colors.black),
                        _buildbutton('.', Colors.white, Colors.black),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildbutton('(  )', Colors.grey[100], Colors.blue[900]),
                        _buildbutton('8', Colors.white, Colors.black),
                        _buildbutton('5', Colors.white, Colors.black),
                        _buildbutton('2', Colors.white, Colors.black),
                        _buildbutton('0', Colors.white, Colors.black),
                  ],
                 ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildbutton('%', Colors.grey[100], Colors.blue[900]),
                        _buildbutton('9', Colors.white, Colors.black),
                        _buildbutton('6', Colors.white, Colors.black),
                        _buildbutton('3', Colors.white, Colors.black),
                        _buildbutton('+/-', Colors.white, Colors.black),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildbutton('/', Colors.grey[100], Colors.blue[900]),
                        _buildbutton('X', Colors.grey[100], Colors.black),
                        _buildbutton('-', Colors.grey[100], Colors.black),
                        _buildbutton('+', Colors.grey[100], Colors.black),
                        _buildbutton('=', Colors.green, Colors.white),
                      ],
                    ),
                  ),
              ],
        ),
            ],
          ),
       )
     ),
    );
  }
}
