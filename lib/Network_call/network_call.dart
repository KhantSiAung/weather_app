import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/service/location_service.dart';

import '../Model/forecast_model.dart';

class NetworkCall {
  var getlocation = GetLocation();
  Future<Wathermodel> fetchWeatherData() async {
    await getlocation.checkLocation();
    double latitude = getlocation.latitude ?? 0.0;
    double longtitude = getlocation.longtude ?? 0.0;
    print("loaction class go to network class $latitude");
    print("loaction class go to network class $longtitude");
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=1c98d67c708fb4f33b01301841909d2b&units=metric"));
    if (response.statusCode == 200) {
      final data = wathermodelFromJson(response.body);
      return data;
    } else {
      throw Exception(" Fail");
    }
  }

  var location = GetLocation();
  Future<Forecastmodel> fetchForecastData() async {
    await getlocation.checkLocation();
    double latitude = getlocation.latitude ?? 0.0;
    double longtitude = getlocation.longtude ?? 0.0;
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longtitude&appid=1c98d67c708fb4f33b01301841909d2b&units=metric"));
    if (response.statusCode == 200) {
      final data = forecastmodelFromJson(response.body);
      return data;
    } else {
      throw Exception("Fail");
    }
  }

  // this is call function
  //retrun data       //function name //      //parameter  // asynaous programing
  Future<Wathermodel> searchcity(String name) async {
    // variable            // fatch data to sever
    final response = await http.get(Uri.parse(
        //Url
        "https://api.openweathermap.org/data/2.5/weather?q=$name&appid=1c98d67c708fb4f33b01301841909d2b&units=metric"));

    if (response.statusCode == 200) {
      //json serialization
      var data = wathermodelFromJson(response.body);
      print(response.body);
      print("This data is search data ${data.name}");
      return data;
    } else {
      throw Exception("Please search again");
    }
  }
}
