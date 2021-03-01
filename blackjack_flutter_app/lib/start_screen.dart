import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: new Text("Start Screen"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Name:"),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter name';
                  }
                  return null;
                },
              ),
              Text("Amount:"),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Amount of Money';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                  child: (Text("Submit")),
                ),
              ),
            ],
          )),
    );
  }
}
