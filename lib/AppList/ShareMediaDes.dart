import 'package:flutter/material.dart';
import 'package:money_crafter/models/detailScreenModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareMediaDes extends StatefulWidget {
  const ShareMediaDes({super.key});

  @override
  State<ShareMediaDes> createState() => _ShareMediaDesState();
}

class _ShareMediaDesState extends State<ShareMediaDes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Media'),
      ),
      body: DetailedScreenModel(
        appName: 'Share Media',
        description: '''
        Task : 
        step 1: Scroll Down go for Open ShareMedia Button
        step 2: Download and install that app
        step 3: Again Visit MoneyCrafter -> Open task -> Scroll Down for Open ShareMedia Button (or) copy the given referal code.
        step 4: Register your account using referal code.
        step 5: After complete Signup visit our App Again. Visit MoneyCrafter -> Open task -> Scroll Down for Fill verification Form Button
        step 6: Fill that form and Submit it. 
        
        
        
        ''',
        longDescription: '''
        Note: 
        1) Take screenShot of you filled details in ShareMedia App.
        2) Take ScreenShot of Homepage In ShareMedia App.
        3) Screenshot must be in lessthan 1mb.
        Withdraw of your amount will be in the month end we automatically send it to your bank account
        ''',
        imageUrl:
            'https://kanagaraj-m.github.io/assets/apps/share_medi_logo.png',
        // link: ,
        appOpenButton: () async {
          const url = "https://play.google.com/store/apps/details?id=mskp.tamilanproject.sharemediapro.xyz";
          final Uri _url = Uri.parse(url);
          await launchUrl(
            _url,
            mode: LaunchMode.externalApplication,
            webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true,

              // ,
            ),
          );
        },
        verificationFormlink: () async {
          const url = "https://forms.gle/HA2YJp1w5UijsvEu9";
          final Uri _url = Uri.parse(url);
          await launchUrl(
            _url,
            mode: LaunchMode.externalApplication,
            webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true,

              // ,
            ),
          );
        },
        refcode: 'kaizenDvLooP', rewardrs: 'r.s 10',
      ),
    );
  }
}
