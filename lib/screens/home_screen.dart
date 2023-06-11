import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/appbar_widget.dart';
import 'package:toonflix/widgets/weboon_widge.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: MyAppBar(
        appBar: AppBar(),
        title: '오늘의 웹툰',
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: (1 / 1.6),
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var webtoon = snapshot.data![index];
                  return Webtoon(webtoon: webtoon);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
