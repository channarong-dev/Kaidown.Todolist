import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "No AppBar Pls",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation degOnewpointOne, degOnewpointTwo, degOnewpointThree;
  late Animation rotationAnimation;
//radian
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

//make an animation 4
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = //
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Colors.brown[200],
        ),
        Container(
          width: size.width,
          height: size.height,
          child: Stack(
            // use stack because buttons are stacked behind 1
            children: <Widget>[
              Positioned(
                  right: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.transparent,
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        //angle of icon like 180 225 270 3
                        offset: Offset.fromDirection(
                            getRadiansFromDegree(
                                270), // distance 100 from main botton
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          //ปุ่ม 2
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print("First Button");
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    appBar:
                                        AppBar(title: Text('My to do list')),
                                    body: Center(
                                      child: TextButton(
                                        child: Text('หวัดดี'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ));
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(225),
                            degTwoTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.black,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print("Second button");
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degThreeTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print("Third Button");
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    appBar:
                                        AppBar(title: Text('My to do list')),
                                    body: Center(
                                      child: TextButton(
                                        child: Text('หวัดดี'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ));
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.red,
                          width: 60,
                          height: 60,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onClick: () {
                            if (animationController.isCompleted) {
                              animationController.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
