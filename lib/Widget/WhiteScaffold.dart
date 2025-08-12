import 'package:flutter/material.dart';

class WhiteScaffold extends StatelessWidget {
  const WhiteScaffold({
    super.key,
    required this.data,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/sprites/BG_White.jpg'),fit: BoxFit.cover),
        ),

        child: SafeArea(
          child:
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 100,),
                    Text('Home',style: TextStyle(color: Colors.black,fontSize: 35,fontFamily: 'Oswald',fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),
                    IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/main_profile');}, icon: Icon(Icons.account_circle_rounded,color: Colors.black,size: 40,)),
                    SizedBox(width: 10,),
                    IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/choose_location');}, icon: Icon(Icons.location_on_outlined,color: Colors.black,size: 40,)),
                  ],),

                SizedBox(height: 150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_location,color: Colors.black,size: 50,),
                    Text('Edit Location',style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: 'Oswald'),),
                  ],
                ),
                SizedBox(height: 10,),
                Text('${data['location']}',style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'Oswald'),),
                SizedBox(height: 5,),
                Text('${data['time']}', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 66, fontFamily: 'Babas'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}