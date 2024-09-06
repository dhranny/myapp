import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double pr = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(24.0, 80.0, 24.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FUTA CPE BOT',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFontFamily')),
            SizedBox(
              height: 20,
            ),
            const Text('Signup to your account', style: TextStyle(fontSize: 22)),
            SizedBox(height: 30.0),
            SizedBox(
              height: 60.0,
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter yor email address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5), // Corner radius
                  ),
                ),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString(_usernameController.text, _passwordController.text);                 
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}