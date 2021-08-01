import 'dart:math';

class BrainCalculator {
  final int height;
  final int weight;

  double _bmi;
  BrainCalculator({this.weight, this.height});

  String bmiCalculator() {
    print('$weight $height');
    _bmi = weight / pow(height / 100, 2);
    print('$_bmi');
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    print('$_bmi');
    if (_bmi > 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getBMIInterpretation() {
    if (_bmi > 25) {
      return 'Exercise more';
    } else if (_bmi > 18.5) {
      return 'Good to go';
    } else {
      return 'Eat healthy';
    }
  }
}
