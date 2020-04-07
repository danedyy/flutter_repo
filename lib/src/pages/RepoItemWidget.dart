import 'package:flutter/cupertino.dart';
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
        Flexible(
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(this.repo.avatar),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    this.repo.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body2,
                  ),
                  Text(
                      this.repo.owner,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
