import 'package:flutter/material.dart';
import 'package:ipadmob/pages/provider/ad_banner_provider.dart';
import 'package:ipadmob/pages/provider/ad_interstitial_banner.dart';
import 'package:ipadmob/pages/provider/ad_reward_provider.dart';
import 'package:ipadmob/pages/view/home_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _initGoogleMobileAds();
    super.initState();
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AdBannerProvider()),
        ChangeNotifierProvider(create: (_) => AdInterstitialProvider()),
        ChangeNotifierProvider(create: (_) => AdRewardProvider()),
      ],
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
