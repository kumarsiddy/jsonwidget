import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/eventhandler/click_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PreviewPage extends StatelessWidget {
  final String jsonString;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  PreviewPage(this.jsonString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: FutureBuilder<Widget>(
        future: _buildWidget(context),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? SizedBox.expand(
                  child: snapshot.data,
                )
              : Text("Loading...");
        },
      ),
    );
  }

  Future<Widget> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build<FormBuilderState>(
        jsonString, context, new DefaultClickListener(),
        stateKey: _fbKey);
  }
}

class DefaultClickListener implements ClickEventListener {
  @override
  void onClicked(ClickEvent event) {
    print('onClick called');
    print(event.toString());
  }
}
