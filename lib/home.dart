import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _result = '';
      } else if (value == '=') {
        try {
          final expression = Expression.parse(_expression);
          const evaluator = const ExpressionEvaluator();
          final result = evaluator.eval(expression, {});
          _result = ' = $result';
        } catch (e) {
          _result = ' Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chris Lopez', style: TextStyle(fontSize: 35.0)), centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(26.0),
              alignment: Alignment.bottomRight,
              child: Text(
                '$_expression$_result',
                style: const TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                ...['7', '8', '9', '/'],
                ...['4', '5', '6', '*'],
                ...['1', '2', '3', '-'],
                ...['C', '0', '=', '+'],
              ].map((value) {
                return GridTile(
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(value),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: 
                      value == 'C' ? Colors.red[300] : 
                      value == '=' ? Colors.green[300] : 
                      value == '+' ? Colors.grey[700] :
                      value == '-' ? Colors.grey[700] :
                      value == '*' ? Colors.grey[700] :
                      value == '/' ? Colors.grey[700] :
                      Colors.blue[300],
                      foregroundColor: Colors.white, // Change 'primary' to 'onPrimary'
                    ),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 34.0),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
