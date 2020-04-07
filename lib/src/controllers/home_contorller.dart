import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_repo/src/models/repos.dart' as model;
import 'package:flutter_repo/src/repository/home_repository.dart';

class HomeController extends ControllerMVC {
  List<model.Repos> repos = <model.Repos>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  HomeController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForRepos();
  }

  void listenForRepos({String message}) async {
    final Stream<model.Repos> stream = await getRepos();
    stream.listen((model.Repos _repo) {
      setState(() {
        print(_repo);
        repos.add(_repo);
      });
    }, onError: (a) {
      print(a);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('verify your internet connection'),
      ));
    }, onDone: () {
      if (message != null) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  Future<void> refreshRepos() async {
    repos.clear();
    listenForRepos(message: "Refresh Successful");
  }
}
