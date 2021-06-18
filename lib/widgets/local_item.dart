import '../models/category_model.dart';
import '../models/content.dart';
import 'package:flutter/material.dart';

class LocalItem extends StatelessWidget {
  final List<CategoryModel> category;
  const LocalItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        for (int i = 0; i < category.length; i++)
          for (int k = 0; k < category[i].content!.length; k++)
            _buildListLocal(
              category[i].content![k],
              category[i].title,
              context,
            ),
      ],
    );
  }

  Widget _buildListLocal(
      Content content, String? category, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content.code ?? 'no data code',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.title ?? 'no data title',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    content.subtitle ?? 'no data subtitle',
                    maxLines: 4,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            category ?? 'no data category',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
