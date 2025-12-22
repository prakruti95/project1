import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project1/user/onboardingscreen/onboardinscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState()
  {
    // TODO: implement initState
   // super.initState();
    checkconnection();


  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center
          (
              child: Lottie.asset("assets/anim.json"),
          ),
      );
  }

  void checkconnection() async
  {
    var status = await Connectivity().checkConnectivity();

    if(status.contains(ConnectivityResult.wifi))
    {
      Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingScreen())));
        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
    else if(status.contains(ConnectivityResult.mobile))
    {
      Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingScreen())));
      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Internet Found")));
    }
  }
}
