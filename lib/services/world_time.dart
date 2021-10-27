import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  late String location;//location name for the UI
  late String time;
  late String flag;//url to an asset flag icon
  late String url;
  late bool isDaytime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    //make the request
   try{
     Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
     Map data=jsonDecode(response.body);
     //get properties from data
     String datetime=data['datetime'];
     String offset=data['utc_offset'];
     String hours=offset.substring(0,1)+offset.substring(2,3);
     String minutes=offset.substring(0,1)+offset.substring(4,6);
     DateTime now=DateTime.parse(datetime);
     now=now.add(Duration(hours: int.parse(hours),minutes: int.parse(minutes)));

     isDaytime= now.hour > 8 && now.hour < 20 ? true : false;
     time=DateFormat.jm().format(now);

   }
   catch(e){
     print('caught error: $e');
     time='could not get time data';
   }

    }


}
