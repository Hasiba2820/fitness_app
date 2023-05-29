import 'dart:convert';

import 'package:day45/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExercisesModel? exercisesModel;
  List<ExercisesModel> myList = [];
  var uriLink =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR1s0681ePa8Rr6o_MM04G4Hnpp8MlweW4DKO-SOawqKbIB2nlR98cBzpT8";

  fetchHomeData() async {
    var responce = await http.get(Uri.parse(uriLink));
    var data = jsonDecode(responce.body);
    print("our data are $data");
    for (var i in data["exercises"]) {
      exercisesModel = ExercisesModel(
        title: i["title"],
        image: i["thumbnail"],
        id: i["id"],
        gif: i["gif"],
      );
      myList.add(exercisesModel!);
    }
    print(
        "Total length isssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss ${myList.length}");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          exercisesModel: myList[index],
                        )));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 12),
                height: 200,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "${myList[index].image}",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${myList[index].title}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black,
                                Colors.black,
                                Colors.black54,
                                Colors.black12,
                                Colors.transparent
                              ])),
                        ))
                  ],
                ),
              ),
            );
          },
          itemCount: myList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
