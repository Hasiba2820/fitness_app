import 'dart:async';
import 'package:flutter/material.dart';

import '../model/model.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, this.second, this.exercisesModel}) : super(key: key);

  ExercisesModel? exercisesModel;
  int? second;
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int startTime = 0;
  @override
  void initState() {
    // TODO: implement initState
    print("our time issssssssssssssssssss${widget.second}");
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick - 1 == widget.second) {
        print("doneeeeeeeeeeeeeeeeeeeeeeeee");
        timer.cancel();
        Navigator.of(context).pop();
      } else {
        setState(() {
          startTime = timer.tick;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("${widget.exercisesModel!.gif}"),
            Text("$startTime")
          ],
        ),
      ),
    );
  }
}
