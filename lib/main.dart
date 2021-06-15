import 'dart:ffi';

import 'package:flutter/material.dart';


void main(){
  runApp(scorecounter());
}

class scorecounter extends StatelessWidget {
  const scorecounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      title: "Score Counter",
      home: ScoreHome(),
    );
  }
}

class ScoreHome extends StatefulWidget {
  const ScoreHome({Key? key}) : super(key: key);

  @override
  _ScoreHomeState createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome
> {
  int number=0;
  void IncreaseNumber()  {
    setState(() {
      number++;
    });
  }

  void DecreaseNumber() {
    setState(() {
      number--;
    });
  }

  void resetNumber() {
    setState(() {
      number=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(title: Text("Score Counter"),
      centerTitle: true
           ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore_outlined),
        onPressed: resetNumber,
      ),
    body:Column(
      children: [
        SizedBox(height: 6,),
         Center(child: Text("Score",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Colors.green),)),
        Center(child: Text(number.toString()  ,style:TextStyle(fontWeight: FontWeight.bold, fontSize: 200,color: Colors.green),)),
        SizedBox(height: 50,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height:60, width: 150, child:RaisedButton(textColor:Colors.white,color:Colors.green,child:Text("Increase"), onPressed:IncreaseNumber)),
             SizedBox(width: 40,),
             SizedBox(height:60, width: 150, child:RaisedButton(textColor:Colors.white,color:Colors.red,child:Text("Decrease"), onPressed:DecreaseNumber)),
    ],
         ),
        ],
    ),
    );
  }
}
