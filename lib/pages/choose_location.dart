import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  bool isLoading = true;
  String errorMessage = '';

  List<WorldTime> cardItems = [
    WorldTime(location: 'America', flagUrl: 'https://i.pinimg.com/1200x/13/bd/6d/13bd6d5502f1ec11784b7ed4a3956c0b.jpg', url: 'America/Lima'),
    WorldTime(location: 'Africa', flagUrl: 'https://i.pinimg.com/736x/c5/11/84/c511849575695e25d58881cf27308b0f.jpg', url: 'Africa/Abidjan'),
    WorldTime(location: 'Japan', flagUrl: 'https://i.pinimg.com/1200x/70/ff/11/70ff11f5565dc5a3774ea54c2d2d8a87.jpg', url: 'Japan'),
    WorldTime(location: 'Berlin', flagUrl: 'https://i.pinimg.com/1200x/69/47/44/6947440cad32f8c2e6ffd692389471dc.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Australia', flagUrl: 'https://i.pinimg.com/1200x/bd/1c/d0/bd1cd0eb0b7380d5d4c6407f6240b6f8.jpg', url: 'Australia/Darwin'),
    WorldTime(location: 'Canada', flagUrl: 'https://i.pinimg.com/1200x/f9/42/ee/f942ee935d91258ca412c659a7a958d4.jpg', url: 'Canada/Central'),
    WorldTime(location: 'Egypt', flagUrl: 'https://i.pinimg.com/1200x/12/7c/a5/127ca54afd557d8c086fb2a6fec7be92.jpg', url: 'Egypt'),
    WorldTime(location: 'Panama', flagUrl: 'https://i.pinimg.com/736x/e8/1b/3a/e81b3acff54992c821cbd55dddfaf1c7.jpg', url: 'America/Panama'),
    WorldTime(location: 'Atlantic', flagUrl: 'https://i.pinimg.com/736x/bc/d4/8e/bcd48e39281565d549f2cd9ce44920a8.jpg', url: 'Atlantic/St_Helena'),
  ];

  void _handleLocationTap (WorldTime location) async
  {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      await Future.wait([
        location.getData(),
      ]);
      if(mounted)
      {
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          'location': location.location,
          'flagUrl': location.flagUrl,
          'time': location.time,
          'isDaytime': location.isDaytime,
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sprites/BG_White.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 100),
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bebas',
                          ),
                        ),
                        SizedBox(width: 50),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/main_profile');
                          },
                          icon: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                        SizedBox(width: 10),

                      ],
                    ),
                    Divider(height: 20, thickness: 1, color: Colors.black),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: cardItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        _handleLocationTap(cardItems[index]);
                        },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: OverflowBox(
                                    child: Image(image: NetworkImage(cardItems[index].flagUrl),fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Text(cardItems[index].location,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Bebas',letterSpacing: 1),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}