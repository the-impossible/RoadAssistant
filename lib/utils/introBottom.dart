import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/clearDefaultButton.dart';
import 'package:welcome/utils/constant.dart';


import '../routes/routes.dart';

class introBottom extends StatelessWidget {
  const introBottom({
    Key? key,
    required int currentPage,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (_currentPage == 0 || _currentPage == 1)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.landing);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(fontFamily: 'Schyuler', color: kShow),
                    ),
                  ),
                )
              : ClearDefaultButton(
                  name: '',
                  press: () {},
                ),
          Container(
            width: MediaQuery.of(context).size.width - 150,
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LinearProgressIndicator(
              backgroundColor: kWhiteColor,
              value: (_currentPage + 1) / (introData.length + 0),
              valueColor: const AlwaysStoppedAnimation<Color>(kDarkColor),
            ),
          ),
          (_currentPage == 2)
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.landing);
                    },
                    child: const Text(
                      "DONE",
                      style: TextStyle(
                        fontFamily: 'Schyuler',
                        color: kShow,
                      ),
                    ),
                  ),
                )
              : ClearDefaultButton(
                  name: '',
                  press: () {},
                ),
        ],
      ),
    );
  }
}
