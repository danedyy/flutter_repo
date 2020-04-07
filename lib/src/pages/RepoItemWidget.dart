import 'package:flutter/material.dart';
import 'package:flutter_repo/src/models/repos.dart' as model;

class RepoItemWidget extends StatelessWidget {
  model.Repos repo;

  RepoItemWidget({Key key, this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        SizedBox(width: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                this.repo.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.body2,
              ),
              Text(
                  this.repo.owner,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }
}
