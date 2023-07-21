
import 'package:flutter/material.dart';
final myController = TextEditingController();
bool _check(var number)
{
  if (number <2)
  {
    return false;
  }else
  {
    for(var i=2; i< number ~/ 2; i++)
    {
      if(number%i==0)
      {
        return false;
      }
    }
    return true;
  }
}
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    //TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kiem tra so nguyen to'),
        ),
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        gapPadding: 10,
                      )
                  ),
                  controller: myController,
                ),
                snackBar()
              ],
            ),
          ),
        ),

      ),
    );
  }
}
class snackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: ElevatedButton(
            onPressed: () {
              var result = '';
              int? number = int.tryParse(myController.text);
              if (myController.text.isEmpty) {
                result = 'Hay nhap vao so nguyen';
              }
              else {
                if (number == null) {
                  result = 'Ban hay nhap vao so nguyen';
                }
                else {
                  bool check = _check(number);
                  if (check) {
                    result = 'so $number la so nguyen to ';
                  }
                  else {
                    result = 'so $number khong la so nguyen to';
                  }
                }
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  result,
                  style: const TextStyle(fontSize: 15),
                ),
                duration: const Duration(seconds: 5),
              ));
            },
            child: const Text('Kiem tra',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
