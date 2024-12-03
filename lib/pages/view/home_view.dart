import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipadmob/pages/view/ad_banner_view.dart';
import 'package:ipadmob/pages/view/ad_interstitial_view.dart';
import 'package:ipadmob/pages/view/ad_reward_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP AdMob'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => AdBannerView()));
                },
                child: Text('Banner')
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => AdInterstitialView()));
                },
                child: Text('Interstitial')
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => AdRewardView()));
                },
                child: Text('Rewarded')
            ),
          ],
        ),
      ),
    );
  }
}
