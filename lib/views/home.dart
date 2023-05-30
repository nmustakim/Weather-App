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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
      
          body: SingleChildScrollView(
              child: Stack(
                children:[
                  Image.asset("assets/images/landscape.png", height: MediaQuery.of(context).size.height,fit: BoxFit.fitHeight,),
                  Column(children: [
                    const SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _cityController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WeatherScreen(_cityController.text)),
                                );
                              },
                              icon: const Icon(Icons.search,color: Colors.white,)),
                          focusColor: Colors.white,

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 3),
                          ),
                          hintText: 'Enter City',hintStyle: const TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                  ),

                ]

              ),
        ]
              ))),
    );
  }
}
