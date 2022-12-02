import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<String> items = [
    'test1',
    'test2',
    'test3',
    'test4',
    'test5'
  ]; // 테스트를 위한 더미데이터
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissble 테스트"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Dismissible(
          direction: DismissDirection.endToStart, // 한쪽 방향만 가능
          background: Container(
              // 스와이프 시 컨테이너 화면 스타일
              color: Colors.red,
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 40,
              )),
          key: Key(
              'item ${items[index]}'), // Dismissible의 키 값은 필수 => 어떤 것을 삭제 하는지 알아야함.
          child: ListTile(
            leading: Icon(Icons.local_activity, size: 50),
            title: Text(items[index]),
          ),

          //경고창 띄우기
          confirmDismiss: (DismissDirection direction) async {
            // DismissDirection 타입의 매개변수 필요함
            return await showDialog(
                // async를 사용하는 이유 - DismissDirection콜백 함수가  Future의 boll을 필요로함.
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: Text("정말 삭제를 하시겠습니까?"),
                    content: Text("삭제하면 채팅방의 모든 내용은 삭제 됩니다."),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Delete")),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                }));
            // onDismissed: (direction) {
            //   setState(() {
            //     items.removeAt(index);
            //   });
            // },
          },
        ),
      ),
    );
  }
}
