import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [ 
            Container(
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/About1.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              ),
            ),
           
            Padding(padding: EdgeInsets.all(15),
              child: Text('MyOwn is a virtual tourist guide specially designed to help tourist to have better experience and knowledge about there trip and the places of visit, our team has provided a huge data over every tourist place for the users comfort and knowledge.',
              style: TextStyle(fontSize: 18,),),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: Text('Objective \n\nWhenever a person goes to a new tourist place they will need some information on what are they looking at, and then they need someone to tell them about it but, due to population, and lack of guides they didn’t get any guide to inform or to guide them about the tourist spot at that moment we need an application which will help us get information about everything. \nOur application can be very beneficial for tourists across the globe to visit India who sometimes are unaware of the places they are missing in the shadows of big tourist spots. \n\nUnlike other applications available on the internet, our app has more features and data about all major and minor places in and near the cities. It will help people to plan their vacation in new tourist spots every year.\nThe application can help users get information about a monument by clicking its picture from the camera by application, a picture can be taken, from any angle and the app will provide every information available.\n\nIt can provide you information just by Voice command on the application microphone.\nThe application provides user map features to find the tourist spot on the map and to find ways.\nCurrently this application is made for Indore only and will be expanded to whole India step by step.',
              style: TextStyle(fontSize: 18,),),
            ),
            Align(alignment: Alignment.topLeft,
              child: Padding(padding: EdgeInsets.all(15),
                child: Text('Features:\nDetailed Information \nSecure user login \nSmart categorisation \nMaps  \nVoice search \nSearch by picture \n\nVersion:1.0',
                style: TextStyle(fontSize: 18,),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}