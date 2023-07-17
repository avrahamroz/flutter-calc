import 'package:flutter/material.dart';
import 'package:untitled/calc_btn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1=0;
  String? operator;
  int num2=0;
  String screen = "";
// 25 + 3


  void _BtnClicked(String char){
    int? value = int.tryParse(char);

    if(value == null){
      if(char == "C"){
        num1 = 0;
        num2 = 0;
        operator = null;
        screen = "";
      }
      else if(char == "="){
        switch(operator){
          case "+":
            num1 += num2;
            break;
          case "-":
            num1 -= num2;
            break;
          case "/":
            num1 ~/= num2;
            break;
          case "*":
            num1 *= num2;
            break;
        }
        num2 = 0;
        setState(() => screen = num1.toString());
      }else{
        operator = char;
      }
    }else if(operator == null){ // first num
      num1 =  num1 * 10 + value;
    }else{ // second num
      num2 =  num2 * 10 + value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(screen),
          Row(
            children: [
                CalcBtn(text: "1", cb: _BtnClicked),
                CalcBtn(text: "2", cb: _BtnClicked),
                CalcBtn(text: "3", cb: _BtnClicked)

            ],
          ),
          Row(
            children: [
              CalcBtn(text: "4", cb: _BtnClicked),
              CalcBtn(text: "5", cb: _BtnClicked),
              CalcBtn(text: "6", cb: _BtnClicked)

            ],
          ),
          Row(
            children: [
              CalcBtn(text: "7", cb: _BtnClicked),
              CalcBtn(text: "8", cb: _BtnClicked),
              CalcBtn(text: "9", cb: _BtnClicked)

            ],
          ),
          Row(
            children: [
              CalcBtn(text: "0", cb: _BtnClicked),
              CalcBtn(text: "+", cb: _BtnClicked),
              CalcBtn(text: "-", cb: _BtnClicked)
            ],
          ),
          Row(
            children: [
              CalcBtn(text: "/", cb: _BtnClicked),
              CalcBtn(text: "*", cb: _BtnClicked),
              CalcBtn(text: "C", cb: _BtnClicked)
            ],
          ),

        ],
      ),
    );
  }
}
