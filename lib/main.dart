import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorWidget());
}

class CalculatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalaulatorState();
  }
}

class CalaulatorState extends State<CalculatorWidget> {
  String historyValue = '0';
  String lastValue = '0';
  String newValue = '0';
  String operator = '';

  void pressedNum(String Num) {
    setState(() {
      if (newValue == '0') {
        newValue = Num;
      } else {
        newValue += Num;
      }

      if (historyValue == '0') {
        historyValue = Num;
      } else {
        historyValue += Num;
      }
    });
  }

  void pressedOper(String op) {
    setState(() {
      lastValue = newValue;
      historyValue += op;
      newValue = '';
      operator = op;
    });
  }

  void cacluateResult() {
      double num1 = double.parse(lastValue);
      double num2 = double.parse(newValue);
      double ret = 0;
      if(operator == '+') {
        //
        ret = num1 +num2;
      } else if(operator == '-') {
        //
        ret = num1 - num2;
      } else if(operator == '*') {
        //
        ret = num1 * num2;
      } else if(operator == '/') {
        ret = num1/num2;
      }
      historyValue += '=';
      setState(() {
        newValue = ret.toString();
        lastValue = '0';
        operator = '';
      });

  }

  void clearAllContent() {
    setState(() {
      lastValue = '0';
      newValue = '0';
      historyValue = '0';
      operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  //上半部分
                    child:Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  historyValue,
                                  style: TextStyle(fontSize: 52, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  newValue,
                                  style: TextStyle(fontSize: 100, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    )
                ),
                //中间隔线
                SizedBox(height: 12),
                //下半部分
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonClicks('AC', (_) => clearAllContent(), Colors.grey.shade400, Colors.black),
                          buttonClicks('+/-', pressedOper, Colors.grey.shade400, Colors.black),
                          buttonClicks('%', pressedOper, Colors.grey.shade400, Colors.black),
                          buttonClicks('/', pressedOper, Colors.orange, Colors.white),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonClicks('7', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('8', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('9', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('*', pressedOper, Colors.orange, Colors.white),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonClicks('4', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('5', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('6', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('-', pressedOper, Colors.orange, Colors.white),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonClicks('1', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('2', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('3', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('+', pressedOper, Colors.orange, Colors.white),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 180,
                            child: buttonClicks('0', pressedNum, Colors.grey.shade800, Colors.white),
                          ),
                          buttonClicks('.', pressedNum, Colors.grey.shade800, Colors.white),
                          buttonClicks('=', (_) => cacluateResult(), Colors.orange, Colors.white),

                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),

                ),

              ],
            )
        ),
      ),
    );
  }

}

Widget buttonClicks (String buttonValue, Function(String) onPressed, Color buttonColor, Color textColor) {
  return GestureDetector(
    onTap:(){
      onPressed(buttonValue);
    },
    child: Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text( buttonValue, style: TextStyle(color: textColor, fontSize: 32)),
      ),
    ),
  );
}