import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SelectBox Test',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SelectBox Test'),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<dynamic> _category = [
    // 리스트
    Category(id: 1, name: "뷰티"),
    Category(id: 2, name: "운동"),
    Category(id: 3, name: "취미"),
    Category(id: 4, name: "댄스"),
    Category(id: 5, name: "뮤직"),
  ];
  final _items = _category
      .map((category) => MultiSelectItem<Category>(category, category.name))
      .toList(); // 선택 가능한 항목을 보여줌 -> 리스트를 깊은 복사

  List<dynamic> _selectCategory = []; // 담을 공간
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // 선택된 아이템을 리스트에 담아줌
    _selectCategory = _category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              MultiSelectDialogField(
                // 1번째 체크박스
                items: _items,
                title: Text("Category"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Favorite Category",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  _selectCategory = results;
                },
              ),
              SizedBox(height: 50),
              MultiSelectChipField(
                // 두번째 selectbox , 가로로 스크롤 하면서 선택 가능
                items: _items,
                initialValue: [], // 기본 설정 값(선택하지 않아도 자동으로 선택 되어있음.)
                title: Text("Category"),
                headerColor: Colors.blue.withOpacity(0.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1.8),
                ),
                selectedChipColor: Colors.blue.withOpacity(0.5),
                selectedTextStyle: TextStyle(color: Colors.blue[800]),
                onTap: (values) {
                  // 선택된 아이템들을 리스트에 담아줌.
                  _selectCategory = values;
                },
              ),
              SizedBox(height: 40),
              MultiSelectDialogField(
                // 3번째 selectbox, 아래에 체크된 값을 미리 보여줌.
                onConfirm: (val) {
                  _selectCategory = val;
                },
                dialogWidth: MediaQuery.of(context).size.width * 0.7,
                items: _items,
                initialValue: _selectCategory, // 선택된 값을 필드 아래에 미리 보여줌.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
