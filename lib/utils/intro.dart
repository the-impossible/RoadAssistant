import 'package:flutter/material.dart';
import 'package:welcome/components/introData.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/utils/introBottom.dart';


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
