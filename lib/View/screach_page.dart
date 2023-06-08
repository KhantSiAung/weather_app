import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/Network_call/network_call.dart';
import 'package:weather_app/service/weatherconditionicon.dart';

class ScreachPage extends StatefulWidget {
  const ScreachPage({Key? key}) : super(key: key);

  @override
  State<ScreachPage> createState() => _ScreachPageState();
}

class _ScreachPageState extends State<ScreachPage> {
  NetworkCall networkCall = NetworkCall();
  TextEditingController cityController = TextEditingController();
  WeatherStatus weatherStatus = WeatherStatus();
  Wathermodel? wathermodel; // variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Search for City"),
          backgroundColor: const Color(0xff045A72),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size(300, 60),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, bottom: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'city name';
                              }
                              return null;
                            },
                            controller: cityController,
                            textInputAction: TextInputAction.search,
                            decoration: const InputDecoration(
                                hintText: 'Search for city',
                                contentPadding: EdgeInsets.only(left: 24.0),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      //all we do variabel defind
                      Wathermodel _weathermodel =
                          await networkCall.searchcity(cityController.text);
                      //value assgin
                      setState(() {
                        wathermodel = _weathermodel;
                      });
                    }),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJbCO9nGK2Mnz5KaVNYQuaI5PE0v-8t9x31g&usqp=CAU"),
                fit: BoxFit.cover),
          ),
          child: wathermodel?.name == null
              ? Container()
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        wathermodel?.name ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(weatherStatus.getWeatherIcon(wathermodel?.weather[0].id??0),style: const TextStyle(fontSize: 80),),
                      const SizedBox(height: 20,),
                      Text(
                        "It's ${wathermodel?.weather[0].description ?? ""}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${wathermodel?.main.temp.toString() ?? ""}°',
                        style: const TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'FeelsLike ${wathermodel?.main.feelsLike.toString() ?? ""}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'wind ${wathermodel?.wind.speed.toString() ?? ""} mph',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Humidity ${wathermodel?.main.humidity.toString() ?? ""}%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
