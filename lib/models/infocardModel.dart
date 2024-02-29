import 'package:flutter/material.dart';

class InfoCardModel extends StatelessWidget {
  final String refappLink;
  final String appname;
  final String description;
  final VoidCallback onTap;

  InfoCardModel({
    required this.refappLink,
    required this.appname,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 290,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 290,
                decoration: ShapeDecoration(
                  color: Color(0xFF3F3737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 23,
              child: Container(
                width: 159,
                height: 140,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(refappLink),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 192,
              top: 23,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 140,
                child: Text(
                  appname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 34,
              top: 172,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 79,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
