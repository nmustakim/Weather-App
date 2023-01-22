import 'package:flutter/material.dart';
import 'package:weather_forecast/views/weather.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                height: 800,
                padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.white])),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Note: Same code is applied for the TextFormField as well
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 3),
                            ),
                            hintText: 'Enter City',hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WeatherScreen(_cityController.text)),
                                );
                              },
                              icon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                                child: const Icon(Icons.search),
                              ))
                        ],
                      )
                    ],
                  ),
                  Text("WeatherEasy",style: TextStyle(fontSize: 40,color: Colors.black),),
                  Text("Knowing weather around you made easy"),
                  Expanded(child: Image.asset("assets/images/weather-forecast.png",))

                ]),

            )
        ));
  }
}
