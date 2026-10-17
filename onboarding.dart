import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
          ),
        ),
        body: Center(
          child: TextFieldInputScreen(
            onSubmit: (text) {
              print(text);
            },
          ),
        ),
      ),
    );
  }
}

class TextFieldInputScreen extends StatelessWidget {
  TextFieldInputScreen({super.key, required this.onSubmit});

  final void Function(String) onSubmit;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // Everything in this column needs spacing and padding.
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6), 
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Icon(Icons.mail, size: 50),
        ),
        SizedBox(height: 30), // Space between Icon and Upper Big Text
        Text('Continue with Email', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Sign in with your School Email', style: TextStyle(fontSize: 13)),
        SizedBox(height: 27), // Space Lower Small Text and TextField
        Row (
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2, 
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                ),
                controller: _textEditingController,
                autofocus: true,
                onSubmitted: (input) {
                  onSubmit(_textEditingController.text.trim());
                  _textEditingController.clear();
                },
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        //SizedBox(height: 150), // Space between TextField and Submit Button
        Expanded(flex: 8, child: Container()),
        Row (
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
            flex: 2, 
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 23.0),
                backgroundColor: Colors.blueGrey.shade900,
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white, // Using a basic material color
                  ),
                ),
              ),
            ),
            ), 
            Expanded(flex: 2, child: Container()),
          ]
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  } 
}
