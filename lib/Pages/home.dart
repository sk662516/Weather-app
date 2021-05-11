import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Map sample={
    'location': 'No data',
    'sunrise': '',
    'sunset': '',
    'speed': '',
    'deg': '',
    'temp': '',
    'max_temp': '',
    'min_temp': '',
    'feels': '',
    'pressure': '',
    'humidity': '',
    'desc': 'No internet',
    'long_desc': '',
    'img_id': '',
    'date': ''
  };
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    double wdh = MediaQuery.of(context).size.width;
    FocusScope.of(context).unfocus();
    data = data.isEmpty ? (ModalRoute.of(context).settings.arguments) : data;
    if (data['sunrise'] == null) {
      data=sample;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topLeft,
                colors: [Color(0xFFd9a7c7), Color(0xFFfffcdc)])),
        height: MediaQuery.of(context).size.height,
        width: wdh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 40.0),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: FlatButton.icon(
                onPressed: () async {
                  dynamic val = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if(val!=null){
                      data = val;
                    }
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                label: Text(
                  '  Search your city name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(
                    'http://openweathermap.org/img/wn/'+data['img_id']+'@2x.png',
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 50.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(data['date'],
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w200
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0,bottom: 30.0),
              child: Column(
                children: [
                  Text(
                    data['feels'],
                    style: TextStyle(
                        color: Colors.white30,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    data['desc'],
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    data['long_desc'],
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent.withOpacity(0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(data['temp'],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(data['min_temp'],
                            style: TextStyle(
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white38
                            )),
                        Text(data['max_temp'],
                            style: TextStyle(
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white38
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(data['pressure'],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                        )
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(data['humidity'],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                        )
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(((){
                      if(data['temp']=='')
                        return '';
                      else
                        return 'Wind';
                    }()),
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(data['speed'],
                            style: TextStyle(
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white38
                            )),
                        Text(data['deg'],
                            style: TextStyle(
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white38
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(data['sunrise'],
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70
                        )),
                    Text(data['sunset'],
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70
                        )),
                    SizedBox(
                      height: 15.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
