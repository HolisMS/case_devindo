import '../widgets/local_item.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({Key? key}) : super(key: key);

  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  List<CategoryModel> category = [];
  List<CategoryModel> categoryShow = [];

  @override
  void initState() {
    super.initState();
    _buider(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: _searchField(),
        actions: [
          Icon(
            Icons.search_outlined,
            color: Colors.white,
          )
        ],
      ),
      body: _buider(context),
    );
  }

  FutureBuilder<String> _buider(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/category.json'),
      builder: (context, snapshot) {
        category = parseCategory(snapshot.data);

        return categoryShow.isNotEmpty
            ? LocalItem(category: categoryShow)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/opps.jpg',
                      height: 100,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Local data not found !!!',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              );
      },
    );
  }

  _searchField() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search local data...',
          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          )),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            categoryShow = category.where((element) {
              var title = element.title!.toLowerCase();
              return title.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}
