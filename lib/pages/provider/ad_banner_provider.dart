import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../helpers/ad_helper.dart';
import '../../services/ad_service.dart';

class AdBannerProvider with ChangeNotifier {
  final AdService _adService;

  BannerAd? _bannerAd;
  BannerAd? get bannerAd => _bannerAd;

  AdBannerProvider() : _adService = AdService();

  void loadBannerAd() async {
    _bannerAd = null;
    notifyListeners();
    await _adService.loadBannerAd(
      onAdLoaded: (ad) {
        _bannerAd = ad;
        notifyListeners();
      },
      onAdFailed: () {
        notifyListeners();
      },
    );
  }

  void disposeBannerAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
}
