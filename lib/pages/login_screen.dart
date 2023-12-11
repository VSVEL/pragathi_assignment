import 'package:flutter/material.dart';
import 'package:prag_assignment/components/round_textfeild.dart';
import 'package:prag_assignment/pages/home_screen.dart';
import 'package:prag_assignment/services/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppTheme.primaryGreen,
                      Colors.white,
                    ]),
              ),
            ),
            Container(
              height: 700,
              width: 350,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pragathi Solutions',
                      style: TextStyle(fontSize: 40.0),
                    ),
                    RoundedTextField(),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedTextField(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
