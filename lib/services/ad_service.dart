import 'dart:ui';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../helpers/ad_helper.dart';

class AdService {
  Future<void> loadBannerAd({
    required Function(BannerAd?) onAdLoaded,
    required Function onAdFailed,
  }) async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) => onAdLoaded(ad as BannerAd),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          onAdFailed();
        },
      ),
      request: AdRequest(),
    ).load();
  }

  Future<void> loadInterstitialAd({
    VoidCallback? onDismissAction,
    required Function(InterstitialAd?) onAdLoaded,
    required Function(LoadAdError?) onAdFailed,
  }) async {
    await InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              onDismissAction?.call();
            },
          );
          onAdLoaded(ad);
        },
        onAdFailedToLoad: onAdFailed,
      ),
    );
  }

  Future<void> loadRewardedAd({
    VoidCallback? onDismissAction,
    required Function(RewardedAd?) onAdLoaded,
    required Function(LoadAdError?) onAdFailed,
  }) async {
   return await RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
          );
          onAdLoaded(ad);
        },
        onAdFailedToLoad: onAdFailed,
      ),
    );
  }
}
