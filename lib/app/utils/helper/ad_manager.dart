import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager extends AdWithViewListener {
  InterstitialAd? _interstitialAd;

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'YOUR_AD_UNIT_ID',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd!.fullScreenContentCallback = this as FullScreenContentCallback<InterstitialAd>?;
        },
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      print('InterstitialAd not available');
    }
  }

  @override
  void onInterstitialAdClosed(InterstitialAd ad) {
    ad.dispose();
    loadInterstitialAd();
  }

  // Implement other callback methods if needed
}