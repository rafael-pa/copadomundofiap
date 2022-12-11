import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyScaffold extends StatelessWidget {

  const MyScaffold({
    super.key,
    required this.body,
    this.title = const Text(""),
    this.colors = const [Color(0xFFb92d45), Color(0xFF000000)],
    this.stops = const [0.1, 1.0],
    this.actions
  });

  final Widget body;
  final Widget title;
  final List<Color>? colors;
  final List<double>? stops;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: title,
          actions: actions,
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: colors!,
                  stops: stops!
                )
            ),
            child: body
        )
    );
  }

}