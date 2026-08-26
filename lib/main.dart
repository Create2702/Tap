import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var themeSwitch = ThemeMode.dark;
  int counter = 0;

  Color colorSwitch() {
    if (themeSwitch ==  ThemeMode.dark) {
      return Colors.white;
    } else {
      return const Color.fromARGB(255, 36, 36, 36);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.dark)
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.light)
      ),
      themeMode: themeSwitch,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$counter', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

              SizedBox(height: 80,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Text('Tap'),
                  ),
                )
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colorSwitch(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        if (themeSwitch == ThemeMode.dark) {
                          themeSwitch = ThemeMode.light;
                        } else {
                          themeSwitch = ThemeMode.dark;
                        }
                      });
                    },
                    child: Text('Switch theme'),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 227, 38, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: Text('Reset'),
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}