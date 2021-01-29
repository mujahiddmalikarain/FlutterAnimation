import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  Widget builder(BuildContext context, Widget child) {
    return new Container(
      height: animation.value,
      width: animation.value,
      child: new FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
            child: new AnimatedBuilder(
          animation: animation,
          builder: builder,
        )),
      ),
    );
  }
}
