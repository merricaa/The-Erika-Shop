import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qualiferika/detail.dart';
import 'package:qualiferika/home.dart';
import 'package:qualiferika/login.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualiferika/post.dart';

class itemsPage extends StatefulWidget {
  final String username;
  itemsPage({super.key, required this.username});

  @override
  State<itemsPage> createState() => _itemsPageState();

  List<Post> posts = [
    Post(
        id: 1,
        title: "Olive Body Scrub/250ml",
        image: 'assets/images/bodyScrubOlive.png',
        description: "Body scrub made by trade organic olive oil",
        price: "Rp. 250.000"),
    Post(
        id: 2,
        title: "Shea Butter Scrub/250ml",
        image: 'assets/images/bodyScrubShea.png',
        description:
            "Shea butter lotion with shea extract, hepls smoothing your skins.",
        price: "Rp. 230.000"),
    Post(
        id: 3,
        title: "Avocado Lotion/250ml",
        image: 'assets/images/BodyLotionAvocado.png',
        description:
            "\Body lotion with avocado extract, helps to moisture skins",
        price: "\Rp. 250.000"),
    Post(
        id: 4,
        title: "Almond Lotion/250ml",
        image: 'assets/images/bodylotionAlmond.png',
        description: "Moisturized the skin with almond milk for sensitive skin",
        price: "Rp. 229.000"),
    Post(
        id: 5,
        title: "Ampoule Sheets Mas",
        image: 'assets/images/maskBlackTea.png',
        description: "Peeling toner that gives a crisp and refreshing feeling.",
        price: "Rp. 45.000"),
    Post(
        id: 6,
        title: "Jeju Mask/100ml",
        image: 'assets/images/maskJeju.png',
        description:
            "Pore tightening + sebum control + exfoliation with Jeju Volcanic.",
        price: "Rp. 120.000"),
  ];
}

class _itemsPageState extends State<itemsPage> {
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (_, model, __) {
          return MaterialApp(
            theme: ThemeData.light(), // Provide light theme.
            darkTheme: ThemeData.dark(), // Provide dark theme.
            themeMode: model.mode, // Decides which theme to show.
            home: Scaffold(
              appBar: AppBar(
                title: const Text("The Erika Shop"),
                backgroundColor: const Color(0xff3D8361),
                actions: [
                  PopupMenuButton(
                      itemBuilder: (context) => [
                            PopupMenuItem(child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return SwitchListTile(
                                  title: const Text('Dark Mode'),
                                  value: darkTheme,
                                  onChanged: (bool value) {
                                    setState(() {
                                      darkTheme = value;
                                      model.toggleMode();
                                    });
                                  },
                                );
                              },
                            )),
                          ])
                ],
              ),
              drawer: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        decoration:
                            const BoxDecoration(color: Color(0xff3D8361)),
                        accountName: Text(widget.username),
                        accountEmail: const Text(''),
                        currentAccountPicture: const Icon(
                          Icons.account_circle_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.home,
                          color: Color(0xff3D8361),
                        ),
                        title: const Text("Home"),
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage(
                              username: widget.username,
                            );
                          }))
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.shopping_cart,
                          color: Color(0xff3D8361),
                        ),
                        title: const Text("Products"),
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return itemsPage(
                              username: widget.username,
                            );
                          }))
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.exit_to_app_rounded,
                          color: Color(0xff3D8361),
                        ),
                        title: const Text("Logout"),
                        onTap: () => {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return const Login();
                          }), (route) => false)
                        },
                      )
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 10.0),
                child: GridView.count(
                  primary: true,
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 1.0,
                  crossAxisCount: 2,
                  children: List.generate(6, (index) {
                    return Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Color(0xffA1C298),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return detailPage(
                                  username: widget.username,
                                  productId: widget.posts[index].id,
                                  productTitle: widget.posts[index].title,
                                  productDesc: widget.posts[index].description,
                                  productImage: widget.posts[index].image,
                                );
                              }));
                            },
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Image.asset(
                                    widget.posts[index].image,
                                    width: 200,
                                    height: 100,
                                  ),
                                  Text(
                                    widget.posts[index].title,
                                  ),
                                  Text(widget.posts[index].price),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
                ),
              ),
            ),
          );
        },
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
