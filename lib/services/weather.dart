import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = 'd36f18a6d34439b4684fcf2166660e12';
const OPEN_WEATHER_API_URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityData(String cityName) async {
    HttpHelper httpHelper = HttpHelper(
        '$OPEN_WEATHER_API_URL?q=$cityName&appid=${API_KEY}&units=metric');
    var data = await httpHelper.getAPIData();
    return data;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    HttpHelper httpHelper = HttpHelper(
        '$OPEN_WEATHER_API_URL?lat=${location.latitude}&lon=${location.longitude}&appid=${API_KEY}&units=metric');
    var data = await httpHelper.getAPIData();
    return data;
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
