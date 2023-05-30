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
      appBar: AppBar(elevation: 0,centerTitle:true,title:  const Text("WeatherEasy",style: TextStyle(fontSize: 32),),
        ),
        body: SafeArea(
            child: Container(

                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.white])),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Note: Same code is applied for the TextFormField as well
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                        WeatherScreen(_cityController.text)),
                        );
                        },child: const Icon(Icons.search,color: Colors.white,)),
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
                          hintText: 'Enter City',hintStyle: const TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                  ),


                  Expanded(child: Image.asset("assets/images/weather-forecast.png",))

                ]),

            )
        ));
  }
}
