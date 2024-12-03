import 'package:flutter/material.dart';
import 'package:ipadmob/pages/provider/ad_reward_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/ad_helper.dart';

class AdRewardView extends StatefulWidget {
  const AdRewardView({super.key});

  @override
  State<AdRewardView> createState() => _AdRewardViewState();
}

class _AdRewardViewState extends State<AdRewardView> {

  late AdRewardProvider _adProvider;

  @override
  void initState() {
    Future.microtask(() {
      _adProvider = Provider.of<AdRewardProvider>(context, listen: false);
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
    return Consumer<AdRewardProvider>(
      builder: (context, data, child) {
        final ad = data.rewardedAd;
        return Scaffold(
          appBar: AppBar(
            title: Text('Rewarded Ad'),
          ),
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hadiah yang kamu dapatkan: ${data.reward} point'),
                  SizedBox(height: 24,),
                  ElevatedButton(
                      onPressed: () async {
                        _adProvider.loadAndShowRewarded();
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
