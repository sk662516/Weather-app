import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/fun.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key key}) : super(key: key);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  String val;
  int error=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    double wdh = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [Color(0xFFd9a7c7), Color(0xFFfffcdc)])),
        width: wdh,
        child: Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 40.0),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.grey,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                hintText: 'City',
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey
                )
              ),
              style: TextStyle(
                fontSize: 20.0
              ),
              autofocus: true,
              onSubmitted: (val) async {
                Fetch_data ins=Fetch_data(city: '$val');
                await ins.gettime();
                if(ins.sunrise!=null) {
                  Navigator.pop(context, {
                    'location': ins.location,
                    'sunrise': ins.sunrise,
                    'sunset': ins.sunset,
                    'speed': ins.windspeed,
                    'deg': ins.winddeg,
                    'temp': ins.temp,
                    'max_temp': ins.max_temp,
                    'min_temp': ins.min_temp,
                    'feels':ins.feel,
                    'pressure': ins.pressure,
                    'humidity': ins.humidity,
                    'desc': ins.desc,
                    'long_desc': ins.lg_desc,
                    'img_id': ins.img_id,
                    'date': ins.date
                  });
                }else{
                  setState(() {
                    error=1;
                  });
                }
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(((){
            if(error==1)
              return 'Wrong city name';
            else
              return 'Enter the City name';
            })(),
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.grey,
              fontWeight: FontWeight.w300
            ),),
          ],
        ),
      ),
    ));
  }
}
