import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 51, 0, 0),
            child: Center(
              child: Container(
                  width: 291,
                  height: 163,
                  padding: EdgeInsets.all(50),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromARGB(255, 107, 62, 231)),
                  child: Text(
                    "MobiPay",
                    style: TextStyle(
                        fontSize: 48,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 107, 62, 231),
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Text(
              'Please sign in to continue',
              style: TextStyle(
                color: Color.fromARGB(255, 107, 62, 231),
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              'EMAIL',
              style: TextStyle(
                color: Color.fromARGB(255, 107, 62, 231),
                fontSize: 15,
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              //hintText: 'Enter your email',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: Text(
              'PASSWORD',
              style: TextStyle(
                color: Color.fromARGB(255, 107, 62, 231),
                fontSize: 15,
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              //hintText: 'Enter a password',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      //backgroundColor: Colors.white, // background
                      primary: Color.fromARGB(255, 107, 62, 231), // foreground
                    ),
                    onPressed: () {},
                    child: Text('Text Button', style: TextStyle(fontSize: 15))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
