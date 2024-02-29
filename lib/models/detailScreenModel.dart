import 'package:flutter/material.dart';

class DetailedScreenModel extends StatelessWidget {
  final String appName;
  final String description;
  final String longDescription;
  final String imageUrl;
  // final String link;
  final String rewardrs;
  final VoidCallback appOpenButton;
  final VoidCallback verificationFormlink;
  final String refcode;

  const DetailedScreenModel({
    Key? key,
    required this.appName,
    required this.description,
    required this.longDescription,
    required this.imageUrl,
    // required this.link,
    required this.appOpenButton,
    required this.verificationFormlink,
    required this.refcode,
    required this.rewardrs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.network(imageUrl)),
            SizedBox(height: 16),
            Center(
              child: Text(
                appName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 8),
            Text(
              longDescription,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Reward: $rewardrs',
              style: TextStyle(
                  color: Colors.red, fontSize: 30, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'referal code : $refcode',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: verificationFormlink,
              child: Text(
                'Fill verification Form',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: appOpenButton,
              child: Text('Open $appName'),
            ),
          ],
        ),
      ),
    );
  }
}
