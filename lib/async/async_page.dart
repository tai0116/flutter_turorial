import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const nameKey = 'name';
const ageKey = 'age';
const birthdayKey = 'birthday';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const AsyncPage(),
    );
  }

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final birthdayController = TextEditingController();

  String name = '未設定';
  String age = '未設定';
  String birthday = '未設定';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameFocus = FocusNode();
  final ageFocus = FocusNode();
  final birthdayFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString(nameKey) ?? '未設定';
      age = prefs.getString(ageKey) ?? '未設定';
      birthday = prefs.getString(birthdayKey) ?? '未設定';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('名前 $name'),
            Text('年齢 $age'),
            Text('誕生日 $birthday'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('登録'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        focusNode: nameFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(ageFocus);
                        },
                        controller: nameController,
                        decoration: const InputDecoration(labelText: '名前'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '名前を入力してください。';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        focusNode: ageFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(birthdayFocus);
                        },
                        controller: ageController,
                        decoration: const InputDecoration(labelText: '年齢'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '年齢を入力してください。';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        focusNode: birthdayFocus,
                        controller: birthdayController,
                        decoration: const InputDecoration(labelText: '誕生日'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '誕生日を入力してください。';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _save();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('保存'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(nameKey, nameController.text);
    prefs.setString(ageKey, ageController.text);
    prefs.setString(birthdayKey, birthdayController.text);

    setState(() {
      name = prefs.getString(nameKey) ?? '未設定';
      age = prefs.getString(ageKey) ?? '未設定';
      birthday = prefs.getString(birthdayKey) ?? '未設定';
    });
  }
}
