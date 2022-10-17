// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

void main() {
  runApp(const MyApp());
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Hello, Wince",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: 'MontserratAlternateBold')),
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(110, 195, 245, 1),
                    Color.fromRGBO(91, 141, 238, 1),
                  ],
                ),
              ),
              width: 1000,
              height: 10000,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(flex: 3),
                    const GradientText(
                      '32',
                      style: TextStyle(
                          fontSize: 65, fontFamily: 'MontserratAlternateBold'),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(230, 255, 255, 255),
                            Color.fromARGB(25, 255, 255, 255),
                          ]),
                    ),
                    const Spacer(flex: 1),
                    DropShadowImage(
                      image: Image.asset('assets/img/sunny.png'),
                      blurRadius: 0,
                    ),
                    const Spacer(flex: 2),
                    const GradientText(
                      'Today Looks Good',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(230, 255, 255, 255),
                            Color.fromARGB(25, 255, 255, 255),
                          ]),
                    ),
                    const Spacer(flex: 2),
                    const GradientText(
                      'What can I do for you today?',
                      style: TextStyle(fontSize: 18, fontFamily: 'NunitoSans'),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(230, 255, 255, 255),
                            Color.fromARGB(25, 255, 255, 255),
                          ]),
                    ),
                    const Spacer(flex: 15),
                  ]),
            ),
          ))
        ],
      )),
      floatingActionButton: const SizedBox(
        height: 71,
        width: 71,
        child: FloatingActionButton(
          onPressed: null,
          tooltip: 'Increment',
          elevation: 4.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.map),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(91, 141, 238, 1),
                Color.fromRGBO(91, 141, 238, 1),
              ],
            ),
          ),
          child: Container(
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.flood),
                      label: 'FloodMap',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.report),
                      label: 'News',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message),
                      label: 'Messaage',
                    ),
                  ],
                  selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                  unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                  showUnselectedLabels: true,
                  elevation: 0,
                ),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
