import 'package:qualiferika/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class commentTab extends StatefulWidget {
  int postId;
  commentTab({super.key, required this.postId});

  @override
  State<commentTab> createState() => _commentTabState();
}

class _commentTabState extends State<commentTab> {
  @override
  Widget build(BuildContext context) {
    if (!globals.commentList
        .any((element) => element.postId == widget.postId)) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "There is no comment for this product yet!",
          style: TextStyle(fontSize: 15, color: Color(0xffC21010)),
        ),
      );
    } else {
      return Expanded(
          child: ListView.builder(
              itemCount: globals.commentList.length,
              itemBuilder: (context, index) {
                if (globals.commentList[index].postId == widget.postId) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Card(
                        child: ListTile(
                      title: Text(globals.commentList[index].userName),
                      subtitle: Text(
                        globals.commentList[index].userComment,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_rounded,
                            color: Color(0xff3D8361),
                          ),
                        ],
                      ),
                    )),
                  );
                } else {
                  return Container();
                }
              }));
    }
  }
}
