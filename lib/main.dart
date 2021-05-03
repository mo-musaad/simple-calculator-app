import 'package:flutter/material.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {


 // calculator logic
  String text = '0';
  String history = '';
  String operation;
  String res;
  int numOne = 0;
  int numTwo = 0;

  void calculation(btnText) {
    print(btnText);
    if(btnText=='C')
      {
        text='0';
        numOne=0;
        numTwo=0;
        res='';
      }
   else if(btnText=='AC')
    {
      text='0';
      numOne=0;
      numTwo=0;
      res='';
      history='';
    }
   else if(btnText=='<')
     {
       res=text.substring(0,text.length -1);
     }
   else if (btnText=='+'||btnText=='-'||btnText=='X'||btnText=='/'){
     numOne=int.parse(text);
     res='';
     operation=btnText;
    }
   else if (btnText=='=') {
      numTwo = int.parse(text);
      if (operation == '+') {
        res = (numOne + numTwo).toString();
        history = numOne.toString() + operation + numTwo.toString();
      }
      if (operation == '-') {
        res = (numOne - numTwo).toString();
        history = numOne.toString() + operation + numTwo.toString();
      }
      if (operation == 'X') {
        res = (numOne * numTwo).toString();
        history = numOne.toString() + operation + numTwo.toString();
      }
      if (operation == '/') {
        res = (numOne / numTwo).toString();
        history = numOne.toString() + operation + numTwo.toString();
      }
    }
      else {
        res = int.parse(text + btnText).toString();
      }

      setState(() {
        text = res;
      });

  }

  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child:
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(history,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    alignment: Alignment(1.0, 1.0),
                  ),

                  Container(
                    child:
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(text,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    alignment: Alignment(1.0, 1.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.blueGrey, Colors.black),
                calcbutton('C', Colors.blueGrey, Colors.black),
                calcbutton('<', Colors.blueGrey, Colors.black),
                calcbutton('/', Colors.blueGrey, Colors.black),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey[850], Colors.white),
                calcbutton('8', Colors.grey[850], Colors.white),
                calcbutton('9', Colors.grey[850], Colors.white),
                calcbutton('X', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey[850], Colors.white),
                calcbutton('5', Colors.grey[850], Colors.white),
                calcbutton('6', Colors.grey[850], Colors.white),
                calcbutton('-', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey[850], Colors.white),
                calcbutton('2', Colors.grey[850], Colors.white),
                calcbutton('3', Colors.grey[850], Colors.white),
                calcbutton('+', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  color: Colors.grey[850],
                ),
                calcbutton('.', Colors.grey[850], Colors.white),
                calcbutton('=', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
