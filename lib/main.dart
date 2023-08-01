import 'package:flutter/material.dart';
//import 'package:flutter_flashlight/flutter_flashlight.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flulator',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isOn = false;
  var showStatus = 'Light is off';
  
  var Flashlight;

  void toggle() {
    if (isOn) {
      setState(() {
        showStatus = 'Light is off';
        isOn = false;
      });
      Flashlight.lightOff!();
      null;
    } else {
      setState(() {
        showStatus = 'Light is on';
        isOn = true;
      });
      Flashlight.lighton!();
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _new(),
    );
  }

  Widget _new() {
    return Container(
      color:  const Color.fromARGB(255, 16, 16, 17),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  //
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: toggle,
                    child: Container(
                      decoration: isOn
                          ? BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 175, 161, 1),
                                  Color.fromRGBO(102, 208, 255, 1),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 225, 22, 137).withOpacity(0.9),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                ),
                              ],
                            )
                          : const BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                      child: const Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        size: 35,
                      ),
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "FlashLight",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApp() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: 3,
              child: Switch(
                value: isOn,
                activeColor: Colors.yellow,
                onChanged: (value) {
                  setState(() {
                    if (isOn) {
                      isOn = !isOn;
                      Flashlight.lightOff();
                    } else {
                      isOn = !isOn;
                      Flashlight.lightOn();
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}