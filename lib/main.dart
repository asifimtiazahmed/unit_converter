import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_unit_convert/convertBrain.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  ConvertBrain _converter = ConvertBrain();
  String result;

  @override
  void initState() {
    // TODO: implement initState
    _converter.numberFrom = 0;
    _converter.result = 0;
    print('init state called');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          shadowColor: Colors.green[500],
          title: Text('Measures Converter'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bkgm.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(height: 20.0),
                Text('what to convert?',
                style: kLabelStyle,),
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: 250.0,
                    child: TextField(
                      onChanged: (text){
                        var rv = double.tryParse(text);
                        if(rv != null){
                          setState(() {
                            _converter.numberFrom = rv;
                          });
                        }
                      },
                      style: kInputStyle,
                      decoration: InputDecoration(
                        hintText: 'type here',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('from',
                style: kLabelStyle,),
                SizedBox(height: 20.0),
                DropdownButton(items: _converter.measures.map((String value){
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: kInputStyle,),);
                } ).toList(),
                  onChanged: (value){
                  setState(() {
                    _converter.startMeasure = value;
                  });
                  },
                  value: _converter.startMeasure,
                ),
                SizedBox(height: 20.0),
                Text('to',
                style: kLabelStyle,),
            //    Spacer(flex: 1,),
                DropdownButton(items: _converter.measures.map((String value){
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: kInputStyle,),);
                } ).toList(),
                  onChanged: (value){
                    setState(() {
                      _converter.convertedMeasure = value;
                    });
                  },
                  value: _converter.convertedMeasure,
                ),
            //    Spacer(flex: 1,),
                RaisedButton(

                  child: Text('Convert', style: kInputStyle,),
                  onPressed: () {

                    setState(() {
                      result = _converter.convert(_converter.numberFrom, _converter.startMeasure, _converter.convertedMeasure);
                    });
                  }
                ),
           SizedBox(
             height: 20.0,
           ),
                Text(
                    (result == null) ? '' : result,
                  style: kLabelStyle,
                ),
            Expanded(
              flex: 2,
              child: SizedBox(height: 10,),
            ),
            //    Spacer(
            //      flex: 8,
            //    ),
              ],
            ),
          ),
        ),

    );
  }
}