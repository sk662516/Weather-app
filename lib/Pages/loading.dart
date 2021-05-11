import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/fun.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupdata() async {
    Fetch_data ins = Fetch_data(city: 'New Delhi');
    await ins.gettime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': ins.location,
      'sunrise': ins.sunrise,
      'sunset': ins.sunset,
      'speed': ins.windspeed,
      'deg': ins.winddeg,
      'temp': ins.temp,
      'max_temp': ins.max_temp,
      'feels':ins.feel,
      'min_temp': ins.min_temp,
      'pressure': ins.pressure,
      'humidity': ins.humidity,
      'desc': ins.desc,
      'long_desc': ins.lg_desc,
      'img_id': ins.img_id,
      'date': ins.date
    });
  }

  @override
  void initState() {
    super.initState();
    setupdata();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    double wdh = MediaQuery.of(context).size.width;
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topLeft,
                colors: [Color(0xFFd9a7c7), Color(0xFFfffcdc)])),
        height: MediaQuery.of(context).size.height,
        width: wdh,
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
