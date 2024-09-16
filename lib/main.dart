import 'package:flutter/material.dart';
// import 'package:expressions/expressions.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({super.key});

//   @override
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   String _expression = '';
//   String _result = '';

//   void _onButtonPressed(String value) {
//     setState(() {
//       if (value == 'C') {
//         _expression = '';
//         _result = '';
//       } else if (value == '=') {
//         try {
//           final expression = Expression.parse(_expression);
//           final evaluator = const ExpressionEvaluator();
//           final result = evaluator.eval(expression, {});
//           _result = ' = $result';
//         } catch (e) {
//           _result = ' Error';
//         }
//       } else {
//         _expression += value;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Simple Calculator'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 '$_expression$_result',
//                 style: const TextStyle(fontSize: 32.0),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: GridView.count(
//               crossAxisCount: 4,
//               children: [
//                 ...['7', '8', '9', '/'],
//                 ...['4', '5', '6', '*'],
//                 ...['1', '2', '3', '-'],
//                 ...['C', '0', '=', '+'],
//               ].map((value) {
//                 return GridTile(
//                   child: ElevatedButton(
//                     onPressed: () => _onButtonPressed(value),
//                     child: Text(
//                       value,
//                       style: const TextStyle(fontSize: 24.0),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
