part of 'editor.dart';

extension EditorRender on ImageEditorState {
  Widget render(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: header(),
      body: editorImage(context),
      floatingActionButton: toggleButton(),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
