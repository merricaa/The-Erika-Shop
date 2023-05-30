import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualiferika/items.dart';
import 'package:qualiferika/login.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkTheme = false;

  var images = [
    "assets/images/p1.jpg",
    "assets/images/p2.png",
    "assets/images/p3.jpg"
  ];

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
                  title: const Text("Home"),
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
                          onTap: () => {},
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
                body: SafeArea(
                  child: ListView(children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          CarouselSlider(
                            items: images.map((e) => Image.asset(e)).toList(),
                            options: CarouselOptions(
                                aspectRatio: 3.0,
                                height: 400,
                                viewportFraction: 400,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3)),
                          ),
                        ])),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 390,
                          color: Color(0xff94B49F),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 30, top: 20),
                              child: Text(
                                "Our History",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff3D8361),
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 10),
                                child: SizedBox(
                                  width: 320,
                                  child: Text(
                                    'The Erika Shop was founded in August 1991 and located in Brighton, England. It was founded by Erika Felia Oroh who believe that business can be used as a power to help each other',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 10),
                                child: SizedBox(
                                  width: 320,
                                  child: Text(
                                    'The business is inspired by her concerns about the make up at that time that use so many chemical that prove to have a significant risk to skin in a long term.if other people can’t offer her what she need, why don’t make your own?. And that exact time, as if there is a lighting that struck her head that she began to see the opportunity.',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                )),
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
