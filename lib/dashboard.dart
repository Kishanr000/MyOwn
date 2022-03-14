//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myown/Auth/login.dart';
import 'package:myown/Camera/camera_screen.dart';
import 'package:myown/Fun/fun1.dart';
import 'package:myown/Fun/fun2.dart';
import 'package:myown/Fun/fun3.dart';
import 'package:myown/Fun/fun4.dart';
import 'package:myown/Fun/fun5.dart';
import 'package:myown/Image/image1.dart';
import 'package:myown/Image/image2.dart';
import 'package:myown/Image/image3.dart';
import 'package:myown/Image/image4.dart';
import 'package:myown/Image/image5.dart';
import 'package:myown/Image/image6.dart';
import 'package:myown/Image/image7.dart';
import 'package:myown/Image/image8.dart';
import 'package:myown/Image/image9.dart';
import 'package:myown/Map/Test/map.dart';
import 'package:myown/Screen/about.dart';
import 'package:myown/Screen/secondscreen.dart';
import 'package:myown/Screen/secondscreen1.dart';
import 'package:myown/Screen/secondscreen2.dart';
import 'package:myown/home.dart';
import 'package:myown/Map/maps.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:myown/Search/search.dart';
import 'Auth/animation.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectindex = 0;
  bool loading = false;
  List<Widget> widgetOptions = <Widget>[
    Home(),
    MarkerMap(),
    About(),
  ];

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, LoginScreen.id);
  }

  void _onItemTap(int index) {
    setState(() {
      selectindex = index;
    });
  }

  bool _switch = false;

  void initState() {
    super.initState();
    setUpalan();
  }
  

  setUpalan() {
    AlanVoice.addButton(
        "123fa5ba10e39a6ad995242509c235a52e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command) {
    debugPrint("New command: ${command}");
    switch (command["command"]) {
      case "rajwada":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image1(),
            ));
        print('opening');
        break;
      case "gulavat":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Secondscreen(),
            ));
        break;
      case "ralamandal":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Secondscreen1(),
            ));
        break;
      case "omkareshwar":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Secondscreen2(),
            ));
        break;
      case "maheshwar":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image2(),
            ));
        break;
      case "khajrana":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image3(),
            ));
        break;
      case "patal pani":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image4(),
            ));
        break;
      case "chhatribagh":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image5(),
            ));
        break;
      case "lalbagh":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image6(),
            ));
        break;
      case "sarafa":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image7(),
            ));
        break;
      case "choral":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image8(),
            ));
        break;
      case "museum":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Image9(),
            ));
        break;
      case "water park":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fun1(),
            ));
        break;
      case "zoo":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fun2(),
            ));
        break;
      case "fundoor":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fun3(),
            ));
        break;
      case "nakhrali dhandi":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fun4(),
            ));
        break;
      case "snow city":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Fun5(),
            ));
        break;

      default:
        debugPrint("Unknown command: ${command}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _switch ? ThemeData.dark() : ThemeData.light(),
      home: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => Dashboard()));
        },
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FadeAnimation(
                  .5,
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'Welcome',
                      style: TextStyle(color: Colors.white,fontSize: 25),
                    ),
                    
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'images/photo8.jpeg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/photo26.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  ListTile(
                    title: Text('Dark Theme',style: TextStyle(fontSize: 18)),
                    trailing: Switch(
                        value: _switch,
                        onChanged: (_newvalue) {
                          setState(() {
                            _switch = _newvalue;
                          });
                        }),
                  ),
                ),
                SizedBox(height:15),
                FadeAnimation(
                  1.5,
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Nearby',style: TextStyle(fontSize: 18)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MarkerMap();
                          },
                        ),
                      );
                    },
                  ),
                ),SizedBox(height: 5),
                FadeAnimation(
                  1.5,
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('About',style: TextStyle(fontSize: 18)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return About();
                          },
                        ),
                      );
                    },
                  ),
                ),SizedBox(height: 5),
                FadeAnimation(
                  1.5,
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Sign Out', style: TextStyle(fontSize: 18)),
                    onTap: () {
                      logout();
                    },
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFF0097a7),
            title: Text(
              'MyOwn',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CameraScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.camera))
            ],
          ),
          body: SafeArea(
            child: Center(
              child: widgetOptions.elementAt(selectindex),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                // ignore: deprecated_member_use
                title: Text('HOME'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                // ignore: deprecated_member_use
                title: Text('Nearby'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                // ignore: deprecated_member_use
                title: Text('About'),
              ),
            ],
            currentIndex: selectindex,
            onTap: _onItemTap,
          ),
        ),
      ),
    );
  }
}
