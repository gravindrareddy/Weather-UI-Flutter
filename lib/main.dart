import 'package:flutter/material.dart';

void main() => runApp(LightThemeApp());

class LightThemeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Report',
      //theme: ThemeData(fontFamily: 'LexendDeca'),
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          title: Center(
              child: Text(
            "India, Mumbai",
            style: TextStyle(color: Colors.indigo),
          )),
          leading: Icon(
            Icons.dehaze,
            color: Colors.indigo,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.indigo,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset(
                        "assets/images/current_weather_background.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, top: 50),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "25º",
                              style:
                                  TextStyle(fontSize: 90, color: Colors.white),
                            ),
                            Text(
                              "Clouds & sun",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              "Humidity",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              "35º",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Next 15 days",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        FutureWeatherWidget(Colors.green, "Monday",
                            "assets/images/rain.png", "40º", "36º", "68º"),
                        FutureWeatherWidget(Colors.pink, "Tuesday",
                            "assets/images/sun.png", "34º", "26º", "88º"),
                        FutureWeatherWidget(Colors.orange, "Wednesday",
                            "assets/images/light.png", "54º", "46º", "68º"),
                        FutureWeatherWidget(
                            Colors.red,
                            "Thursday",
                            "assets/images/light_cloud.png",
                            "40º",
                            "56º",
                            "68º"),
                        FutureWeatherWidget(Colors.green, "Friday",
                            "assets/images/rain.png", "40º", "56º", "68º"),
                        FutureWeatherWidget(Colors.pink, "Saturday",
                            "assets/images/sun.png", "40º", "56º", "68º"),
                        FutureWeatherWidget(Colors.orange, "Sunday",
                            "assets/images/light.png", "54º", "46º", "68º"),
                        FutureWeatherWidget(
                            Colors.red,
                            "Monday",
                            "assets/images/light_cloud.png",
                            "40º",
                            "56º",
                            "68º"),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FutureWeatherWidget extends StatelessWidget {
  final Color backgroundColor;
  final String day;
  final String weatherConditionIcon;
  final String temperature;
  final String minTemperature;
  final String maxTemperature;

  ///@required will force users to pass value, else, compilation error
  FutureWeatherWidget(this.backgroundColor, this.day, this.weatherConditionIcon,
      this.temperature, this.minTemperature, this.maxTemperature);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 100,
        height: 200,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SmallTextWidget(day),
            Column(children: [
              Image.asset(
                weatherConditionIcon,
                width: 40,
                height: 40,
              ),
              SmallTextWidget(temperature),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SmallTextWidget(minTemperature),
                SmallTextWidget(maxTemperature)
              ],
            )
          ],
        ));
  }
}

class TopBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Chip(label: null),
        
      ],
    );
  }
}

class SmallTextWidget extends StatelessWidget {
  final String text;

  ///@required will force users to pass value, else, compilation error
  SmallTextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        ));
  }
}
