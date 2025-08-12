import 'package:flutter/material.dart';
import 'package:world_time/Widget/WhiteScaffold.dart';
import 'package:world_time/Widget/BlackScaffold.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if(args != null)
      {
        setState(() {
          data = args as Map<String,dynamic>;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    print(data);
      if(data['isDaytime'])
      {
        return  WhiteScaffold(data: data);
      }
      else
      {
        return  BlackScaffold(data: data);
      }

  }
}


