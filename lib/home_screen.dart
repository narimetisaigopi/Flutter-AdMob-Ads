import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ads/names_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd createBannerAd() {
    BannerAd bannerAd =
        BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.smartBanner);
    return bannerAd;
  }

  InterstitialAd createInterstialAd() {
    InterstitialAd interstialAd = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (event) {
        print(
            "************************************$event****************************************");
        switch (event) {
          case MobileAdEvent.clicked:
            // add
            break;
          default:
        }
      },
    );
    return interstialAd;
  }

  createReawrdAdAndLoad() {
    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId,
        targetingInfo: MobileAdTargetingInfo());
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      switch (event) {
        case RewardedVideoAdEvent.rewarded:

          ///
          break;
        default:
      }
      print(
          "************************************createReawrdAdAndLoad $event****************************************");
    };
  }

  @override
  void initState() {
    super.initState();
    createReawrdAdAndLoad();
    createBannerAd()
      ..load()
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Admb Ads")),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.yellow,
                onPressed: () {
                  createBannerAd()
                    ..load()
                    ..show();
                },
                child: Text("Banner Ad"),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.yellow,
                onPressed: () {
                  createInterstialAd()
                    ..load()
                    ..show();
                },
                child: Text("Interstitial Ad"),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.yellow,
                onPressed: () {
                  RewardedVideoAd.instance..show();
                },
                child: Text("Reward Ad"),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.yellow,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => NamesListScreen()));
                },
                child: Text("Navitive Ads"),
              ),
            )
          ],
        ));
  }
}
