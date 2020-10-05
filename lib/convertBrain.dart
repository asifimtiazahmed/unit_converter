class ConvertBrain {

  double numberFrom;
  double result;
  List<String> measures =[
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  String startMeasure;
  String convertedMeasure;



  final Map<String, int> measuresMap = {
    'meters' : 0,
    'kilometers' : 1,
    'grams': 2,
    'kilograms' : 3,
    'feet' : 4,
    'miles' :5,
    'pounds' : 6,
    'ounces':7,
  };

  final dynamic formulas = {
    '0' : [1,0.001,0,0,3.28084,0.000621371,0,0],
    '1' : [1000,1,0,0,3280.84,0.621371,0,0],
    '2' : [0,0,1,0.0001,0,0,0.00220462,0.35274],
    '3' : [0,0,1000,1,0,0,2.20462,35.274],
    '4' : [0.3048,0.0003048,0,0,1,0.000189394,0,0],
    '5' : [1609.34,1.60934,0,0,5280,1,0,0],
    '6' : [0,0,453.592,0.455592,0,0,1,16],
    '7' : [0,0,28.3495,0.0283495,3.28084,0,0.0625,1],
  };

  String convert(double value, String from, String to) {


      int nFrom = measuresMap[from];
      print(from);
      int nTo = measuresMap[to];
      print(to);
      var multiplier = formulas[nFrom.toString()][nTo];
      if (from.isEmpty || to.isEmpty || multiplier == 0) {
        return 'This conversion cannot be performed';
      } else {
        result = value * multiplier;
        return '$value $from are ${result.toStringAsFixed(2)} $to.';
      }
  }

}