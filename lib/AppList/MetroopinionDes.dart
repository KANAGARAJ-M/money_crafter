import 'package:flutter/material.dart';
import 'package:money_crafter/models/detailScreenModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MetroopinionDes extends StatefulWidget {
  const MetroopinionDes({super.key});

  @override
  State<MetroopinionDes> createState() => _MetroopinionDesState();
}

class _MetroopinionDesState extends State<MetroopinionDes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metroopinion'),
      ),
      body: DetailedScreenModel(
        appName: 'Metroopinion',
        description: '''
        Task : 
        step 1: Scroll Down go for Open ShareMedia Button
        step 2: Visit the website
        step 3: Login
        
        
        
        ''',
        longDescription: '''
        Note: 
        
        Withdraw of your amount will be in the month end we automatically send it to your bank account
        ''',
        imageUrl:
            'https://kanagaraj-m.github.io/assets/money_crafter/Metroopinion.jpg',
        // link: ,
        appOpenButton: () async {
          const url = "https://gplinks.co/Metroopinion";
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
          const url = "https://kanagaraj-m.github.io/components/customerror/eye.html";
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
        refcode: ' - ', rewardrs: 'r.s 2',
      ),
    );
  }
}
