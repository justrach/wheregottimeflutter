import 'package:ord_countdown/config/assets.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';




class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  _launchURLGIT() async {
    const url = "https://github.com/rachpradhan/";
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  } _launchURLtwitter() async {
    const url = "https://twitter.com/rachtypesalot";
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  }_launchURLweb() async {
    const url = "https://rachpra.co/#/";
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset(Assets.avatar).image,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rach ',
                textScaleFactor: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Java/Python/Flutter \nLikes to Hike and write stuff :)',
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.github)),
                    label: Text('Github'),
                    onPressed: () => _launchURLGIT(),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.twitter)),
                    label: Text('Twitter'),
                    onPressed: () => _launchURLtwitter(),

                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.web)),
                    label: Text('Website'),
                    onPressed: () => _launchURLweb(),

                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );;
  }
}
