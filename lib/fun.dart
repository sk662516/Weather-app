import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Fetch_data{
  String sunrise;
  String sunset;
  String location;
  String city;
  String windspeed;
  String winddeg;
  String temp,max_temp,min_temp,feel;
  String pressure,humidity;
  String desc,lg_desc;
  String img_id;
  String date;
  Fetch_data({this.city});

  Future<void> gettime() async{
    try{
      //print(Uri.http('api.openweathermap.org','data/2.5/weather',{'q':'kota','appid':'253274b1b1913c052f27afb6fe7f0016','units':'metric'}));
      Response response = await get(Uri.http('api.openweathermap.org','data/2.5/weather',{'q':city,'appid':'253274b1b1913c052f27afb6fe7f0016','units':'metric'}));
      Map data=jsonDecode(response.body);
      if(data['cod']==200){
        DateTime rise=DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise']*1000);
        DateTime set=DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset']*1000);
        location=data['name']+', '+data['sys']['country'];
        windspeed='Speed = '+(data['wind']['speed'].toString())+' kmph';
        winddeg='Degree = '+(data['wind']['deg'].toString())+'°';
        temp='Avg. temp. = '+(data['main']['temp'].toString())+'° C';
        max_temp='Max. temp. = '+(data['main']['temp_max'].toString())+'° C';
        min_temp='Min. temp. = '+(data['main']['temp_min'].toString())+'° C';
        feel='Feels = '+(data['main']['feels_like'].toString())+'° C';
        pressure='Pressure = '+(data['main']['pressure'].toString())+' atm';
        humidity='Humidity = '+(data['main']['humidity'].toString())+' g/m^3';
        desc=data['weather'][0]['main'];
        lg_desc=data['weather'][0]['description'];
        img_id=data['weather'][0]['icon'];
        date=DateFormat('dd-MMM-yyyy').format(set);
        sunset='Sunrise = '+DateFormat.jms().format(set);
        sunrise='Sunset = '+DateFormat.jms().format(rise);
      }else {
        sunrise = null;
        sunset = null;
      }
    }catch(e){
      print('Error is : $e');
      sunrise=null;
      sunset=null;
    }
  }
}