import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_crafter/AppList/ShareMediaDes.dart';
import 'package:money_crafter/models/infocardModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Money  Crafter ',
          style: GoogleFonts.calistoga(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InfoCardModel(
                refappLink:
                    'https://kanagaraj-m.github.io/assets/apps/share_medi_logo.png',
                appname: 'ShareMedia',
                description: 'Share Your Photos and Earn Money',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShareMediaDes()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
