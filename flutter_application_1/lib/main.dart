import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  String text = 'Holaa';
  Color color = Colors.black;
  double size = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(fontSize: size, color: color)),
              SizedBox(height: 100),
              Row(children: [
                ElevatedButton(
                  onPressed: (){setState(() {text = '';});}, 
                  child: Text('Hide'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){setState(() {text = 'Holaa';});}, 
                  child: Text('Show'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ],
              ),
              Row(children: [
                ElevatedButton(
                  onPressed: (){setState(() {color = Colors.blue;});}, 
                  child: Text('Blue'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){setState(() {color = Colors.red;});}, 
                  child: Text('Red'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ],
              ),
              Row(children: [
                ElevatedButton(
                  onPressed: (){setState(() {size += 5;});},
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){setState(() {size -= 5;});}, 
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 120),
                  ),
                ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
