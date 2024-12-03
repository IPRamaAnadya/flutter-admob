import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../services/ad_service.dart';

class AdRewardProvider extends ChangeNotifier {
  final AdService _adService;

  RewardedAd? _rewardedAd;
  RewardedAd? get rewardedAd => _rewardedAd;

  double _reward = 0.0;
  double get reward => _reward;

  AdRewardProvider() : _adService = AdService();

  Future<void> loadAndShowRewarded() async {
    _rewardedAd = null;
    notifyListeners();
    await _adService.loadRewardedAd(
        onAdLoaded: (ad) {
          ad?.show(
              onUserEarnedReward: (_, reward) {
                _reward += reward.amount;
                notifyListeners();
              }
          );
        },
        onAdFailed: (err) {
          notifyListeners();
        }
    );
  }

  void disposeInterstitialAd() {
    _rewardedAd?.dispose();
  }
}