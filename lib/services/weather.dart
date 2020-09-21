import 'package:flutter_weather/services/location.dart';
import 'package:flutter_weather/services/networking.dart';
import 'package:flutter_weather/utilities/constants.dart';

class WeatherModel {
  var apiUrlBase =
      'https://api.openweathermap.org/data/2.5/weather?units=imperial';

  Future<dynamic> getCityWeather(String city) async {
    String url = '$apiUrlBase&q=$city&appid=$kApiKey';
    log(url);
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url =
        '$apiUrlBase&lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey';
    log(url);
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for 🩳 and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
