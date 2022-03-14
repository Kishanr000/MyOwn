//@dart=2.9

import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myown/Camera/camera_screen.dart';
import 'package:myown/Image/image1.dart';
import 'package:myown/Image/image2.dart';
import 'package:myown/Screen/secondscreen.dart';
import 'package:myown/Search/voicesearch.dart';
import 'package:myown/dashboard.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Search'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, );
              },
              icon: Icon(Icons.search))
        ],
      ),
    
    );
  }
}
/*
class DataSearch extends SearchDelegate<String> {
  Color _color = Color(0xff212121);
  final cities = [
    'Rajwada',
    'Lotus Valley',
    'Gulavat',
    'Ralamandal',
    'Omkareshwar',
    'Maheswar',
    'Kahjrana',
    'Patal Pani',
    'Chhatribagh',
    'Lalbagh',
    'Sarafa',
    'Choral',
    'Museum',
    'Water Park',
    'Zoo',
    'Indore Zoo',
    'Fundoor',
    'Nakhrali Dhandi',
    'Snow City'
  ];

  final recentCities = [
    'Rajwada',
    'Louts Valley',
    'Ralamandal',
    'Omkareshwar',
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.grey,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) 
  {
    
      switch (query) {
      case "Rajwda": Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image1(),
            ));
        break;
      case "Gulavat": Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image2(),
            ));
        break;
      default: "unknown";
    };
    
     
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((city) {
            final cityLower = city.toLowerCase();
            final queryLower = query.toLowerCase();
            return cityLower.startsWith(queryLower);
          }).toList();

    return Container(
      color: Colors.grey[400],
      child: ListView.builder(
        itemBuilder: (context, index) {
          final suggestion = suggestionList[index];
          return ListTile(
            onTap: () {
              query = suggestion;
              showResults(context);
            },
            leading: Icon(
              Icons.location_city,
            ),
            title: Text(
              suggestionList[index],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          );
        },
        itemCount: suggestionList.length,
      ),
    );
  }
}*/
