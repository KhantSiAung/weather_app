import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Model/forecast_model.dart';
import 'package:weather_app/Network_call/network_call.dart';
import 'package:weather_app/service/weatherconditionicon.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  NetworkCall networkCall = NetworkCall();
  DateFormat dateFormat = DateFormat(" EEEE");
  WeatherStatus weatherStatus = WeatherStatus();
  @override
  void initState() {
    Forecastmodel.fetchForecastData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC9EEFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffC9EEFF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '5 Days Forecast',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: networkCall.fetchForecastData(),
            builder: ((context, AsyncSnapshot<Forecastmodel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, index) => SizedBox(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47ccff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dateFormat
                                          .format(snapshot.data!.list[27].dtTxt),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${snapshot.data!.list[25].main.temp.toString()}°c",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      weatherStatus.getWeatherIcon(
                                          snapshot.data!.list[0].weather[0].id),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47ccff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dateFormat
                                          .format(snapshot.data!.list[37].dtTxt),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${snapshot.data!.list[5].main.temp.toString()}°c",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      weatherStatus.getWeatherIcon(
                                          snapshot.data!.list[2].weather[0].id),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47ccff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dateFormat.format(
                                          snapshot.data!.list[16].dtTxt),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${snapshot.data!.list[16].main.temp.toString()}°c",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      weatherStatus.getWeatherIcon(
                                          snapshot.data!.list[3].weather[0].id),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47ccff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dateFormat.format(
                                          snapshot.data!.list[0].dtTxt),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${snapshot.data!.list[0].main.temp.toString()}°c",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      weatherStatus.getWeatherIcon(
                                          snapshot.data!.list[4].weather[0].id),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xff47ccff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dateFormat.format(
                                          snapshot.data!.list[10].dtTxt),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${snapshot.data!.list[0].main.temp.toString()}°c",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      weatherStatus.getWeatherIcon(
                                          snapshot.data!.list[5].weather[0].id),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )));
              }
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: const Color(0xff0A2647), size: 50),
              );
            })),
      ),
    );
  }
}
