// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/model/youtube_category.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.categories,
  });

  final List<YoutubeCategory> categories;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < widget.categories.length; i++) {
                              widget.categories[i].categoryChoice =
                                  i == index ? 1 : 0;
                            }
                          });
                        },
                        child: Container(
                          width: widget.categories[index].categoryName ==
                                  'explorer'
                              ? 60
                              : widget.categories[index].categoryName
                                              .trim()
                                              .length *
                                          20 <
                                      70
                                  ? 70
                                  : widget.categories[index].categoryName
                                          .trim()
                                          .length *
                                      20,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14.0)),
                            color: widget.categories[index].categoryChoice == 1
                                ? Colors.white
                                : Colors.black45,
                          ),
                          child: Center(
                            child: widget.categories[index].categoryName ==
                                    'explorer'
                                ? Icon(
                                    Icons.explore,
                                    color: widget.categories[index]
                                                .categoryChoice ==
                                            0
                                        ? Colors.white
                                        : Colors.black,
                                    size: 30,
                                  )
                                : Text(
                                    widget.categories[index].categoryName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: widget.categories[index]
                                                  .categoryChoice ==
                                              0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
