import 'package:flutter/material.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool value = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toggel Light',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value ? 'Lamb is on ' : 'Lamb is off',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 200,
              ),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: value ? Colors.green[300] : Colors.red[300]),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    top: 3.0,
                    right: value ? 0.0 : 60.0,
                    left: value ? 60.0 : 0.0,
                    child: InkWell(
                      onTap: ToggelButton,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: value
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 35,
                                key: UniqueKey(),
                              )
                            : Icon(
                                Icons.remove_circle_outline_outlined,
                                color: Colors.red,
                                size: 35,
                                key: UniqueKey(),
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
    );
  }

  ToggelButton() {
    setState(() {
      value = !value;
    });
  }
}
