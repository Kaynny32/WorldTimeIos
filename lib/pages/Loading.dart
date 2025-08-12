import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool isLoading = true;
  String errorMessage = '';
  WorldTime instatiateAmerica = WorldTime(location: 'America', flagUrl: 'https://i.pinimg.com/1200x/13/bd/6d/13bd6d5502f1ec11784b7ed4a3956c0b.jpg', url: 'America/Lima');

  Future<void> setupWorldTime()async
  {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try{

      await Future.wait([
        instatiateAmerica.getData(),
      ]);
      if(mounted)
        {
          Navigator.pushReplacementNamed(context, '/home', arguments: {
            'location': instatiateAmerica.location,
            'flagUrl': instatiateAmerica.flagUrl,
            'time': instatiateAmerica.time,
            'isDaytime': instatiateAmerica.isDaytime,
          });
        }
    }
    catch(e)
    {
      setState(() {
        errorMessage = 'Error';
      });
    }finally{
      if(mounted)
        {
          setState(() => isLoading = false);
        }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupWorldTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/sprites/BG_White.jpg'),fit: BoxFit.cover),
        ),
        
        child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,20,20,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: SpinKitFadingFour(color: Colors.black,size: 100,)),
                ],
              ),
            ),
        ),
      ),
    );
  }
}