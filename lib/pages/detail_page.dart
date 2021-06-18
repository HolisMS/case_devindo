import '../models/post_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final PostModel? _postModel;
  const DetailPage(this._postModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Detail post data')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: _buildDataPost(_postModel!, context),
        ));
  }

  Widget _buildDataPost(PostModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User ID : ${data.userId}',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'ID : ${data.id}',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 13,
        ),
        Text(data.title ?? 'no data title',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Text(data.body ?? 'no data bosy',
            style: Theme.of(context).textTheme.bodyText1!),
      ],
    );
  }
}
