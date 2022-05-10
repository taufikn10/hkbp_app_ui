// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hkbp_app/components/background.dart';
import 'package:hkbp_app/components/topbar.dart';
import 'package:hkbp_app/fontstyle.dart';
import 'package:hkbp_app/screens/menu/alkitab/details/details_page.dart';

import 'components/body.dart';
import 'components/box.dart';
import 'components/floating_btn.dart';

class AlKitabPage extends StatefulWidget {
  const AlKitabPage({Key? key}) : super(key: key);

  @override
  State<AlKitabPage> createState() => _AlKitabPageState();
}

class _AlKitabPageState extends State<AlKitabPage> {
  late ScrollController _hideButtonController;
  var _isVisible = true;
  @override
  initState() {
    super.initState();
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          print("**** $_isVisible up"); //Move IO away from setState
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            print("**** $_isVisible down"); //Move IO away from setState
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBarDetails(
        txtTitle: "Alkitab",
      ),
      body: Background(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerBox(
                      size: size * 0.6,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailKitab()));
                        },
                        child: Text(
                          "Kejadian 1",
                          style: txtSM14d,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ContainerBox(
                      size: size * 0.1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "TB",
                          style: txtSM16d,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ContainerBox(
                      size: size * 0.1,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.volume_up_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: _hideButtonController,
                shrinkWrap: true,
                slivers: const <Widget>[
                  Body(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: const FloatingBtn(),
      ),
    );
  }
}
