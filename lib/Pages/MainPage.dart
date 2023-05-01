// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int iconbtn = 0;

  final GlobalKey<ScaffoldState> _globalkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalkey,
        drawer: drawerfun(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 40.0,
                  ),
                  color: cstmclr(),
                  onPressed: () {
                    _globalkey.currentState!.openDrawer();
                  },
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: Alignment.center,
                      child: const Text(
                        "Srushti Kulkarni",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: Alignment.center,
                      child: const Text(
                        "Computer Engineer",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/two.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Text(
                      "Connect with me :",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              iconbtn = 0;
                              launchURL(iconbtn);
                            },
                            icon: Icon(
                              FontAwesomeIcons.github,
                              size: 40.0,
                              color: cstmclr(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              iconbtn = 1;
                              launchURL(iconbtn);
                            },
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              size: 40.0,
                              color: cstmclr(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              iconbtn = 2;
                              launchURL(iconbtn);
                            },
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              size: 40.0,
                              color: cstmclr(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  launchURL(iconbtn) async {
    List<String> urllist = [
      "https://github.com/Srushti750",
      "https://twitter.com/kulkarni_s_m",
      "https://linkedin.com/in/srushti-kulkarni-7a4507213",
    ];
    if (await canLaunchUrl(Uri.parse(urllist[iconbtn]))) {
      await launchUrl(Uri.parse(urllist[iconbtn]));
    } else {
      throw 'Could not launch $urllist[iconbtn]';
    }
  }

  drawerfun() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Education"),
            leading: Icon(Icons.school),
            onTap: () => {Navigator.of(context).pushNamed("/education")},
          ),
          ListTile(
            title: Text("Projects"),
            leading: Icon(Icons.assignment),
            onTap: () => {Navigator.of(context).pushNamed("/projects")},
          ),
          ListTile(
            title: Text("Skills"),
            leading: Icon(Icons.engineering),
            onTap: () => {Navigator.of(context).pushNamed("/skills")},
          ),
        ],
      ),
    );
  }

  Color cstmclr() {
    return Color.fromARGB(255, 2, 97, 175);
  }
}
