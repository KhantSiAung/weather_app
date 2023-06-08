import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/View/forecast_page.dart';
import 'package:weather_app/View/screach_page.dart';
import 'package:weather_app/service/location_service.dart';
import 'package:weather_app/Network_call/network_call.dart';
import 'package:weather_app/service/weatherconditionicon.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  GetLocation getLocation = GetLocation();
  NetworkCall networkCall = NetworkCall();
  WeatherStatus weatherStatus = WeatherStatus();
  @override
  void initState() {
    getLocation.checkLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(0xffC9EEFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffC9EEFF),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const ScreachPage())));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
      ),
      body: FutureBuilder(
          future: networkCall.fetchWeatherData(),
          builder: ((context, AsyncSnapshot<Wathermodel> snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) => SizedBox(
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              weatherStatus
                                  .getWeatherIcon(snapshot.data!.weather[0].id),
                              style: const TextStyle(fontSize: 200),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.weather[0].description,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.fitness_center,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      snapshot.data!.main.pressure.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  "${snapshot.data!.main.temp.toString()}°c",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.air,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${snapshot.data!.wind.speed.toString()}km/h",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: const Color(0xff5B8FB9)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          const ForecastPage())));
                                },
                                child: const Text("View Forecast"))
                          ],
                        ),
                      )));
            }
            return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  color: const Color(0xff0A2647), size: 50),
            );
          })),
    );
  }
}
