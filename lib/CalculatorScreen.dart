import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final Function(String) updateHistory;

  const CalculatorScreen({super.key, required this.updateHistory});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input1 = "";
  String input2 = "";
  String result = "";
  String operation = "+";

  // Calculate the result based on the selected operation
  void calculate() {
    try {
      double num1 = double.parse(input1);
      double num2 = double.parse(input2);
      double calculationResult;

      switch (operation) {
        case "+":
          calculationResult = num1 + num2;
          break;
        case "-":
          calculationResult = num1 - num2;
          break;
        case "*":
          calculationResult = num1 * num2;
          break;
        case "/":
          calculationResult = num2 != 0 ? num1 / num2 : double.infinity;
          break;
        default:
          throw Exception("Invalid operation");
      }

      result = calculationResult.toString();
      widget.updateHistory("$input1 $operation $input2 = $result");
      setState(() {});
    } catch (e) {
      result = "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter first number',
              ),
              onChanged: (value) {
                input1 = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter second number',
              ),
              onChanged: (value) {
                input2 = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: operation,
              onChanged: (String? newOperation) {
                setState(() {
                  operation = newOperation!;
                });
              },
              items: const [
                DropdownMenuItem(value: "+", child: Text("+")),
                DropdownMenuItem(value: "-", child: Text("-")),
                DropdownMenuItem(value: "*", child: Text("*")),
                DropdownMenuItem(value: "/", child: Text("/")),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: calculate,
            child: const Text('Calculate'),
          ),
          const SizedBox(height: 20),
          Text('Result: $result', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
