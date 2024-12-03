import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ipadmob/pages/provider/ad_banner_provider.dart';
import 'package:provider/provider.dart';
import '../../services/ad_service.dart'; // Import the AdService

class AdBannerView extends StatefulWidget {

  const AdBannerView({
    super.key,
  });

  @override
  State<AdBannerView> createState() => _AdBannerViewState();
}

class _AdBannerViewState extends State<AdBannerView> {

  late AdBannerProvider _adServiceProvider;

  @override
  void initState() {
    Future.microtask(() {
      _adServiceProvider = Provider.of<AdBannerProvider>(context, listen: false);
      _adServiceProvider.loadBannerAd();
    });
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdBannerProvider>(
      builder: (context, data, child) {
        BannerAd? bannerAd = data.bannerAd;
        return Scaffold(
          appBar: AppBar(
            title: Text('Banner Ad'),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child:  bannerAd != null ? const Text('Ad Banner showing on Top') :  const Text('Ad Banner not Showing'),
                ),
                if (bannerAd != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: bannerAd.size.width.toDouble(),
                      height: bannerAd.size.height.toDouble(),
                      child: AdWidget(ad: bannerAd),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
