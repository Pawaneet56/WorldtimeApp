import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: "Punjab", flag: "India.png", url: "Asia/Kolkata");
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'time' : instance.time,
      'location' : instance.location,
      'flag' : instance.flag,
      'isDaytime' : instance.isDaytime,
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}
