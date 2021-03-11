import 'package:appclimax/model/city.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appclimax/data/data_constants.dart';

final dayFormat = DateFormat('EEEE');

class WeatherDetailsWidget extends StatelessWidget {
  final City city;

  const WeatherDetailsWidget({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Pronostico de ${city.weathers.length} Dias',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: city.weathers.length,
                itemBuilder: (context, index) {
                  final weather = city.weathers[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Text(
                                  dayFormat.format(
                                    weather.applicableDate,
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.network(
                                    '${server}static/img/weather/png/64/${weather.weatherStateAbbr}.png',
                                    height: 25,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '${weather.theTemp.toInt().toString()}°C',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                'viento',
                                textAlign: TextAlign.center,
                              )),
                              Expanded(
                                  child: Text(
                                'Presion de aire',
                                textAlign: TextAlign.center,
                              )),
                              Expanded(
                                  child: Text(
                                'Humedad',
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                '${weather.windSpeed.toStringAsFixed(2)} mph',
                                textAlign: TextAlign.center,
                              )),
                              Expanded(
                                  child: Text(
                                '${weather.airPressure} mbar',
                                textAlign: TextAlign.center,
                              )),
                              Expanded(
                                  child: Text(
                                '${weather.humidity}%',
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
