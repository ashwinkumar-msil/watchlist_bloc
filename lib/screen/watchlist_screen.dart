import 'package:flutter/material.dart';
import 'package:navigation_watchlist/contact_item.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 24,
                  itemBuilder: (
                    BuildContext context,
                    int i,
                  ) {
                    return userList(context, i, 'ashwin', '9845', 'feb wefjew');
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
