import '../pages/detail_page.dart';
import '../widgets/post_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;
  const HomePage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Data'),
        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => Get.toNamed('/local'),
        child: Text(
          'More',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: _buildListPost(),
      ),
    );
  }

  Widget _buildListPost() {
    return Obx(() {
      if (_controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return LazyLoadScrollView(
          onEndOfPage: HomeController.to.loadNextData,
          isLoading: HomeController.to.lastPage,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: HomeController.to.list.length,
            itemBuilder: (context, index) {
              final list = HomeController.to.list[index];
              return PostItem(
                id: list.id.toString(),
                title: list.title ?? 'no data title',
                body: list.body ?? 'no data body',
                onTap: () => Get.to(() => DetailPage(list)),
              );
            },
          ),
        );
      }
    });
  }
}
