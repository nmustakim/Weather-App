import 'package:flutter/material.dart';
import 'package:weather_forecast/remote_service/remote_service.dart';

import '../models/current_weather.dart';

class WeatherScreen extends StatefulWidget {
  String? city;
  WeatherScreen(this.city, {super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

 late CurrentWeather _currentWeather;


  Future <CurrentWeather> getCurrentWeather()async {
    var response = await RemoteService().getWeather(widget.city!);

    setState(() {
      _currentWeather = response;
    });
    return _currentWeather;
  }
  @override
  void initState() {
getCurrentWeather();
_currentWeather = CurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: SafeArea(
            child: Container(
                height: 800,
                padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),

                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.white

                        ]

                    )
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),

                FutureBuilder <CurrentWeather> (
                        future: getCurrentWeather(),
                        builder: (context, snapshot){
                          if (snapshot.hasData && snapshot.data!.cod != null) {

                            return Column(
                              children:
                              [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.location_on,size: 35,),
                                    Text("${snapshot.data!.name!}, ${snapshot.data!.sys!.country!}",style: const TextStyle(fontSize: 35, color: Colors.white),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height:40),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,


                                      children: [

                                        Text("${snapshot.data!.main!.temp!.toInt().toString()}°C",style: const TextStyle(fontSize: 100, color: Colors.white),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("${snapshot.data!.main!.tempMax!.toInt().toString()}°C",style: const TextStyle(fontSize: 25, color: Colors.white),),
                                        const Icon(Icons.arrow_upward,size: 20,),
                                        Text("    ${snapshot.data!.main!.tempMin!.toInt().toString()}°C",style: const TextStyle(fontSize: 25, color: Colors.white),),const Icon(Icons.arrow_downward,size: 20,),
                                        const SizedBox(width: 40,),
                                        Text("Feels like ${snapshot.data!.main!.feelsLike!.toInt().toString()}°C",style: const TextStyle(fontSize: 20, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.network( "https://openweathermap.org/img/wn/${snapshot.data!.weather!.first!.icon}.png",height: 100,),
                                      ],
                                    ),

                                    Text(snapshot.data!.weather!.first!.main!,style: const TextStyle(fontSize: 40, color: Colors.white),),
                                    Text("It's ${snapshot.data!.weather!.first!.description!} here",style: const TextStyle(fontSize: 20, color: Colors.white),),
                                    const SizedBox(height: 20,),  const SizedBox(height: 50,),
                                    Image.asset("assets/images/wind-icon.png",height: 50,width: 70,),
                                    const SizedBox(height: 20,),
                                    Text(" ${snapshot.data!.wind!.speed.toString()} m/s",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),

                                  ],
                                )

                              ],
                            );
                          }
                          else if(snapshot.hasError){
                            return Column(
                              children: const [
                                SizedBox(height:250,),
                                Center(child: Text("No Data!\nSomething Wrong",textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.red),)),Text("")
                            ],);
                          }
                          return const Center(child: CircularProgressIndicator());
                        }
                    )



                  ],
                )
            )
        ),
      ),


    );
  }
}
