// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/model/youtube_category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categories,
  });

  final List<YoutubeCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Icon(
                    Icons.explore,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              ...categories.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: e.categoryName.trim().length * 20 < 70
                          ? 70
                          : e.categoryName.trim().length * 20,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14.0)),
                        color: e.categoryChoice == 1
                            ? Colors.white
                            : Colors.black45,
                      ),
                      child: Center(
                        child: Text(
                          e.categoryName,
                          style: TextStyle(
                            fontSize: 18,
                            color: e.categoryChoice == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
