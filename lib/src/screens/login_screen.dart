import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Referencing the state coming from the form
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  // Build widget
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress ,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      onSaved: (String value) {
        email = value;
      },
      validator: validateEmail,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      onSaved: (String value) {
        password = value;
      },
      validator: validatePassword,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          // When save() is called it triggers the onSaved callbacks on text form fields
          formKey.currentState.save();
          print(email);
          print(password);
        };

      },
      color: Colors.pink[300],
      child: Text('Submit'),
    );
  }
}