import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final TextEditingController _numberControllerA = TextEditingController();
  final TextEditingController _numberControllerB = TextEditingController();
  double _result = 0;

  void _calculateResult(String operator) {
    double numberA = double.tryParse(_numberControllerA.text) ?? 0;
    double numberB = double.tryParse(_numberControllerB.text) ?? 0;

    switch (operator) {
      case '+':
        setState(() {
          _result = numberA + numberB;
        });
        break;
      case '-':
        setState(() {
          _result = numberA - numberB;
        });
        break;
      case 'x':
        setState(() {
          _result = numberA * numberB;
        });
        break;
      case '/':
        setState(() {
          _result = numberB != 0 ? numberA / numberB : 0;
        });
        break;
      default:
        setState(() {
          _result = 0;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImageField(),
              buildTextFiled(),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Kết quả : $_result",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            _calculateResult('+');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            '+',
            style: TextStyle(fontSize: 40),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _calculateResult('-');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text(
            '-',
            style: TextStyle(fontSize: 40),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _calculateResult('x');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text(
            'x',
            style: TextStyle(fontSize: 40),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _calculateResult('/');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow[700],
          ),
          child: const Text(
            '/',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }

  Widget buildTextFiled() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          child: TextFormField(
            controller: _numberControllerA,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nhập số A',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          child: TextFormField(
            controller: _numberControllerB,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nhập số B',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageField() {

    return Column(
      children: [
        Image.network(
          'https://pngimg.com/uploads/calculator/calculator_PNG7937.png',
          width: 250,
        ),
      ],
    );
  }
}