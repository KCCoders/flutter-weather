import 'package:flutter/material.dart';
import 'package:flutter_weather/services/weather.dart';
import 'package:flutter_weather/utilities/constants.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    var location = getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: kSpinKit,
    ));
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
