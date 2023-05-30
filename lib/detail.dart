import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualiferika/commentTab.dart';
import 'package:qualiferika/info.dart';

class detailPage extends StatelessWidget {
  bool darkTheme = false;
  final String username;
  int productId;
  String productTitle;
  String productDesc;
  String productImage;
  detailPage(
      {super.key,
      required this.username,
      required this.productId,
      required this.productTitle,
      required this.productDesc,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Detail"),
          backgroundColor: const Color(0xff3D8361),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.info,
                  color: Color(0xff3D8361),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.comment,
                  color: Color(0xff3D8361),
                ),
              ),
            ]),
            Expanded(
                child: TabBarView(
              children: [
                infoTab(
                  username: username,
                  productId: productId,
                  productTitle: productTitle,
                  productDesc: productDesc,
                  productImage: productImage,
                ),
                commentTab(postId: this.productId)
              ],
            ))
          ],
        )),
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
