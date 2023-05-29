import 'package:day45/screen/page3.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../model/model.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.exercisesModel}) : super(key: key);
  ExercisesModel? exercisesModel;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int second = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "${widget.exercisesModel!.image}",
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Column(
                children: [
                  SleekCircularSlider(
                    min: 0,
                    max: 50,
                    initialValue: 5,
                    onChange: (double value) {
                      setState(() {
                        second = value.toInt();
                        print("selected second isssssssss${second}");
                      });
                      // callback providing a value while its being changed (with a pan gesture)
                    },
                    onChangeStart: (double startValue) {
                      // callback providing a starting value (when a pan gesture starts)
                    },
                    onChangeEnd: (double endValue) {
                      // ucallback providing an ending value (when a pan gesture ends)
                    },
                    innerWidget: (double value) {
                      return Center(
                          child: Text(
                        "${second.toStringAsFixed(0)}",
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ));
                      // use your custom widget inside the slider (gets a slider value from the callback)
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ThirdPage(
                                  exercisesModel: widget.exercisesModel,
                                  second: second,
                                )));
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
