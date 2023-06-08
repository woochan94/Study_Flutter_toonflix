import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/screens/detail_screen.dart';

class DetailListHeader extends StatelessWidget {
  const DetailListHeader({
    super.key,
    required this.widget,
    required this.webtoon,
  });

  final DetailScreen widget;
  final Future<WebtoonDetailModel> webtoon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.webtoon.id,
              child: Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ]),
                child: Image.network(
                  widget.webtoon.thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data!.about,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${snapshot.data!.genre} / ${snapshot.data!.age}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            }
            return const Text("...");
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
