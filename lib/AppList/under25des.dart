import 'package:flutter/material.dart';
import 'package:money_crafter/models/detailScreenModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Under25AppDes extends StatefulWidget {
  const Under25AppDes({super.key});

  @override
  State<Under25AppDes> createState() => _Under25AppDesState();
}

class _Under25AppDesState extends State<Under25AppDes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under 25'),
      ),
      body: DetailedScreenModel(
        appName: 'Under 25',
        description: '''
        Task : 
        step 1: Scroll Down go for Open Under 25 Button
        step 2: Download and install that app
        step 3: Again Visit MoneyCrafter -> Open task -> Scroll Down for Open Under 25 Button (or) copy the given referal code.
        step 4: Register your account using referal code.
        step 5: After complete Signup visit our App Again. Visit MoneyCrafter -> Open task -> Scroll Down for Fill verification Form Button
        step 6: Fill that form and Submit it.       
        ''',
        longDescription: '''
        Note: 
        1) Take screenShot of you filled details in Under 25 App.
        2) Take ScreenShot of Homepage In Under 25 App.
        3) Screenshot must be in lessthan 1mb.
        Withdraw of your amount will be in the month end we automatically send it to your bank account
        ''',
        imageUrl:
            'https://play-lh.googleusercontent.com/a5hJazrTzd7HrPZpPLiZlSQYOMHu7GPwfFLS5EfuuQdbM3Hh5Lzk0rJhm21l-VqoLEY=w240-h480-rw',
        // link: ,
        appOpenButton: () async {
          const url = "https://shared.under25universe.com/Yped";
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
          const url = "https://forms.gle/Nqp5jioRKstoHeca7";
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
        refcode: '01C600', rewardrs: 'r.s 5',
      ),
    );
  }
}
