import 'package:flutter/material.dart';
import 'package:welcome/Intro/components/introData.dart';
import 'package:welcome/Intro/introBottom.dart';
import 'package:welcome/constant.dart';

class Intro extends StatefulWidget {
  Intro({
    super.key,
  });

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var _controller = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
    return Scaffold(
      backgroundColor: kGroundColor,
      
      body: Column(
        
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: introData.length,
                itemBuilder: (context, index) => IntroData(
                      introImage: introData[index]['image'],
                      headText: introData[index]['headText'],
                      descText: introData[index]['descText'],
                    ),
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                }),
          ),
          introBottom(currentPage: _currentPage)
        ],
      ),
    );
  }
}
