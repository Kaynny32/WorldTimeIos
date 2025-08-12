import 'package:flutter/material.dart';

class Mainprofile extends StatefulWidget {
  const Mainprofile({super.key});

  @override
  State<Mainprofile> createState() => _MainprofileState();
}

class _MainprofileState extends State<Mainprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        //leading: SafeArea(child: IconButton(onPressed: (){Navigator.pushNamed(context, '/home');}, icon: Icon(Icons.home_sharp,size: 25,color: Colors.white,))),
        actions: [
          SafeArea(child: IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/choose_location');}, icon: Icon(Icons.edit_location,color: Colors.white,size: 25,))),
          SafeArea(child: IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/home');}, icon: Icon(Icons.home_sharp,color: Colors.white,size: 25,))),
        ],
      ),

      body: Padding(
        padding:  EdgeInsets.fromLTRB(10,10,10,0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/736x/20/70/4e/20704e738b10a4a9d3092c1492b4cae3.jpg'),radius: 45,),
                ],
              ),
              Divider(height: 50,thickness: 2,),
              Row(
                children: <Widget>[

                ],
              ),

        ],
        ),
        ),
      ),
    );
  }
}
