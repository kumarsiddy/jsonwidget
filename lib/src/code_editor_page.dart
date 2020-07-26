import 'package:flutter/material.dart';
import 'package:jsonwidget/src/refyne_sample_page.dart';

class CodeEditorPage extends StatefulWidget {

  CodeEditorPage();

  @override
  State<StatefulWidget> createState() {
    return _CodeEditorPageState();
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState();

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Code Editor"),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/sample.json'),
          builder: (context, snapshot) {
            String jsonString = snapshot.data.toString();
            controller.text = jsonString;
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    constraints: BoxConstraints.expand(
                        width: double.infinity, height: double.infinity),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: 'Enter json string'),
                      maxLines: 1000000,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  child: Text("Preview"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RefyneSamplePage(controller.text)));
                  },
                )
              ],
            );
          }
        ));
    return widget;
  }
}
