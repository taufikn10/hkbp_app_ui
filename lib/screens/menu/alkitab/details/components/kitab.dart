import 'package:flutter/material.dart';
import 'package:hkbp_app/fontstyle.dart';
import 'package:hkbp_app/list/list_kitab.dart';

class Kitab extends StatelessWidget {
  const Kitab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 5),
            child: TextField(
              style: txtR12d,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(color: lightGreyColor),
                ),
                contentPadding:
                    const EdgeInsets.only(top: 5, bottom: 5, left: 12),
                isDense: true,
                suffixIcon: Icon(Icons.search, color: darkColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(color: lightGreyColor),
                ),
                filled: true,
                fillColor: whiteColor,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Cari',
                hintStyle: txtR12l,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listKitab.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    listKitab[index],
                    style: txtM14d,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
