import 'package:flutter/material.dart';
import 'package:weather_forecast/remote_service/remote_service.dart';
import 'package:weather_forecast/views/widgets/reusable_container.dart';

import '../models/current_weather.dart';

class WeatherScreen extends StatefulWidget {
 final String city;
  const WeatherScreen(this.city, {super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

 late CurrentWeather _currentWeather;


  Future <CurrentWeather> getCurrentWeather()async {
    var response = await RemoteService().getWeather(widget.city);

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
      appBar: AppBar(elevation: 0,),
      body:  SingleChildScrollView(
        child: ReusableContainer(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

            FutureBuilder <CurrentWeather> (
                    future: getCurrentWeather(),
                    builder: (context, snapshot){
                      if (snapshot.hasData && _currentWeather.cod != null) {

                        return Column(
                          children:
                          [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on,size: 35,),
                                Text("${_currentWeather.name!}, ${_currentWeather.sys!.country!}",style: const TextStyle(fontSize: 35, color: Colors.white),),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(height:20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,


                                  children: [

                                    Text("${_currentWeather.main!.temp!.toInt().toString()}°C",style: const TextStyle(fontSize: 100, color: Colors.white),),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${_currentWeather.main!.tempMax!.toInt().toString()}°C",style: const TextStyle(fontSize: 25, color: Colors.white),),
                                    const Icon(Icons.arrow_upward,size: 20,),
                                    const SizedBox(width: 40,),
                                    Text("${_currentWeather.main!.tempMin!.toInt().toString()}°C",style: const TextStyle(fontSize: 25, color: Colors.white),),const Icon(Icons.arrow_downward,size: 20,),


                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Text("Feels like ${_currentWeather.main!.feelsLike!.toInt().toString()}°C",style: const TextStyle(fontSize: 20, color: Colors.white),)
                               , Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network( "https://openweathermap.org/img/wn/${_currentWeather.weather!.first!.icon}.png",height: 100,),
                                  ],
                                ),

                                Text(_currentWeather.weather!.first!.main!,style: const TextStyle(fontSize: 40, color: Colors.white),),
                                Text("It's ${_currentWeather.weather!.first!.description!} here",style: const TextStyle(fontSize: 20, color: Colors.black),),
                                const SizedBox(height: 20,),
                                Image.asset("assets/images/wind-icon.png",height: 50,width: 70,),
                                const SizedBox(height: 20,),
                                Text(" ${_currentWeather.wind!.speed.toString()} m/s",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black),),

                              ],
                            )

                          ],
                        );
                      }
                      else if(snapshot.hasError) {
                        return const ReusableContainer(child: Center(child: Text(
                          "No Data!\nSomething Wrong", textAlign: TextAlign
                            .center, style: TextStyle(
                            fontSize: 20, color: Colors.red),)),
                        );
                      }
                      return  const ReusableContainer(child: Center(child: CircularProgressIndicator()));
                    }
                )



              ],
            )
        ),
      ),


    );
  }
}
