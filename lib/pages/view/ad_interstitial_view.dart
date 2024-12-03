import 'package:flutter/material.dart';
import 'package:ipadmob/pages/provider/ad_interstitial_banner.dart';
import 'package:provider/provider.dart';

import '../../helpers/ad_helper.dart';

class AdInterstitialView extends StatefulWidget {
  const AdInterstitialView({super.key});

  @override
  State<AdInterstitialView> createState() => _AdInterstitialViewState();
}

class _AdInterstitialViewState extends State<AdInterstitialView> {

  late AdInterstitialProvider _adProvider;

  @override
  void initState() {
    Future.microtask(() {
      _adProvider = Provider.of<AdInterstitialProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _adProvider.disposeInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdInterstitialProvider>(
      builder: (context, data, child) {
        final ad = data.interstitialAd;
        return Scaffold(
          appBar: AppBar(
            title: Text('Interstitial Ad'),
          ),
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        _adProvider.loadIterstitialAd();
                      },
                      child: Text('Reload iklan')
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        ad?.show();
                      },
                      child: Text('Tampilan iklan')
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
