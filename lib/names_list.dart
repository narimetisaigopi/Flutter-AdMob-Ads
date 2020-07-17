import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class NamesListScreen extends StatefulWidget {
  @override
  _NamesListScreenState createState() => _NamesListScreenState();
}

class _NamesListScreenState extends State<NamesListScreen> {
  var namesList = [
    "Sai",
    "Gopi",
    "Vamsi",
    "Ganesh",
    "Divya",
    "Vinay",
    "Sharvya",
    "Lakshmi",
    "Priya",
    "Ram"
  ];

  final _controller = NativeAdmobController();

  Widget createNativeAd() {
    NativeAdmob nativeAdModAd = NativeAdmob(
      adUnitID: NativeAd.testAdUnitId,
      controller: _controller,
    );

    return Container(
      width: double.infinity,
      height: 100,
      child: nativeAdModAd,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Names List"),
      ),
      //body: dummyImagesList(),
      body: ListView.builder(
        itemCount: namesList.length,
        itemBuilder: (context, index) {
          var card = Card(
            child: ListTile(
              title: Text(namesList[index]),
            ),
          );
          return Column(
            children: [
              card,
              index != 0 && index % 5 == 0 ? createNativeAd() : Container()
            ],
          );
        },
      ),
    );
  }

  dummyImagesList() {
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2216727/pexels-photo-2216727.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2847037/pexels-photo-2847037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 330,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20.0),
          child: NativeAdmob(
            adUnitID: NativeAd.testAdUnitId,
            controller: _controller,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2216727/pexels-photo-2216727.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2847037/pexels-photo-2847037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
