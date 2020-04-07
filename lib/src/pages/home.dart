import 'package:flutter/material.dart';
import 'package:flutter_repo/src/controllers/home_contorller.dart';
import 'package:flutter_repo/src/pages/RepoItemWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_repo/src/models/repos.dart' as model;
import 'package:flutter_repo/src/models/repos.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  HomeController _con;


  _HomePageState() : super(HomeController()) {
    _con = controller;

  }

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Flutter Repos",
          style: Theme.of(context).textTheme.title.merge(TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              letterSpacing: 1.3)),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _con.refreshRepos,
        child: _con.repos.isEmpty
            ? Center(child: Text("no repos"),)
            : SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: _con.repos.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return RepoItemWidget(
                      repo: _con.repos.elementAt(index));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
