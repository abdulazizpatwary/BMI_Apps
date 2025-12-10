import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}
class HomeState extends State<Home>{
  final TextEditingController _ageController=TextEditingController();
  final TextEditingController _heightController=TextEditingController();
  final TextEditingController _weightController=TextEditingController();
  double _finalresult=0.0;
  String _formattedText="";
  Color _resultColor=Colors.black;
  /*< 18.5	Underweight
18.5 – 24.9	Normal weight
25 – 29.9	Overweight
30 – 34.9	Obesity (Class 1)
35 – 39.9	Obesity (Class 2)
≥ 40	Obesity (Class 3 – Severe)*/
  void calculateBmi(){
    setState(() {
      _finalresult=_calcuatebmi(_ageController.text,_heightController.text,_weightController.text);

      if(double.parse(_finalresult.toStringAsFixed(1))<18.5){
        _formattedText="UnderWeight";
        _resultColor=Colors.blue;
      }else if(double.parse(_finalresult.toStringAsFixed(1))>=18.5 && double.parse(_finalresult.toStringAsFixed(1))<25.0){
        _formattedText="Normal";
        _resultColor=Colors.greenAccent;


      }
      else if(double.parse(_finalresult.toStringAsFixed(1))>=25 && double.parse(_finalresult.toStringAsFixed(1))<30){
        _formattedText="Overweight";
        _resultColor=Colors.redAccent;
      }
      else if(double.parse(_finalresult.toStringAsFixed(1))>=30 && double.parse(_finalresult.toStringAsFixed(1))<35){
        _formattedText="Obesity (Class 1)";
        _resultColor=Colors.red;
      }
      else if(double.parse(_finalresult.toStringAsFixed(1))>=35 && double.parse(_finalresult.toStringAsFixed(1))<40){
        _formattedText="Obesity (Class 2)";
        _resultColor=Colors.red;
      }
      else if(double.parse(_finalresult.toStringAsFixed(1))>=40){
        _formattedText="Obesity (Class 3 – Severe)";
        _resultColor=Colors.red;
      }
    });




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("BMI",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Image.asset("images/bmilogo.png",height: 85.0,width: 75.0,),
            Container(

              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,


              child: Column(


                children: <Widget>[
                  TextField(controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Age",
                      hintText: 'e.g: 34',
                      icon: Icon(Icons.person_outline)
                    ),
                  ),

                  TextField(controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height in feet",
                        hintText: 'e.g: 6.5',
                        icon: Icon(Icons.insert_chart)
                    ),

                  ),

                  TextField(controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight in lbs",
                        hintText: 'e.g: 180',
                        icon: Icon(Icons.line_weight)
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.6)),



                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent,foregroundColor: Colors.white),
                        onPressed: calculateBmi,
                        child: Text('Calculate'),

                    ),
                  )

                ],
              ),

            ),
            Column(
              children: <Widget>[
                Text("Your BMI: ${_finalresult.toStringAsFixed(1)}",style: TextStyle(color: Colors.blueAccent,fontStyle:FontStyle.italic, fontWeight: FontWeight.w500,fontSize: 19.9),),
                Text("  $_formattedText  ",style: TextStyle(color: _resultColor,fontStyle:FontStyle.italic,fontWeight: FontWeight.w500,fontSize: 19.0))
              ],
            ),


          ],
        ),
      ),
    );
  }

  double _calcuatebmi(String age, String heightFeet, String weightLb) {
    if(int.parse(age).toString().isNotEmpty || int.parse(age)>0
        && double.tryParse(heightFeet).toString().isNotEmpty || double.tryParse(heightFeet)!>0.0
        && double.tryParse(weightLb).toString().isNotEmpty || double.tryParse(weightLb)!>0.0)
    {

      return (double.tryParse(weightLb)!/((double.tryParse(heightFeet)!*12)*(double.tryParse(heightFeet)!*12)))*703;
    }else
      {
        return 0.0;
      }

  }

}