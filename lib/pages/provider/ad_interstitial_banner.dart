import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../helpers/ad_helper.dart';
import '../../services/ad_service.dart';

class AdInterstitialProvider with ChangeNotifier {
  final AdService _adService;

  InterstitialAd? _interstitialAd;
  InterstitialAd? get interstitialAd => _interstitialAd;

  AdInterstitialProvider() : _adService = AdService();

  void loadIterstitialAd() async {
    await _adService.loadInterstitialAd(
      onAdLoaded: (ad) {
        _interstitialAd = ad;
        notifyListeners();
      },
      onAdFailed: (err) {
        notifyListeners();
      }
    );
  }

  void disposeInterstitialAd() {
    _interstitialAd?.dispose();
  }
}
