import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(child: VerificationCodeGenerator()),
      ),
    ),
  );
}

const CopyTextIntent copyTextIntent = CopyTextIntent._();

class CopyTextIntent extends Intent {
  const CopyTextIntent._();
}

class CopyableText extends StatelessWidget {
  const CopyableText({super.key, required this.text});

  final String text;

  void _copy(CopyTextIntent intent) =>
      Clipboard.setData(ClipboardData(text: text));

  @override
  Widget build(BuildContext context) {
    final Action<CopyTextIntent> defaultCopyAction =
        CallbackAction<CopyTextIntent>(onInvoke: _copy);
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyC, control: true): copyTextIntent
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          // The Action is made overridable so the VerificationCodeGenerator
          // widget can override how copying is handled.
          CopyTextIntent: Action<CopyTextIntent>.overridable(
              defaultAction: defaultCopyAction, context: context),
        },
        child: Focus(
          autofocus: true,
          child: DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

class VerificationCodeGenerator extends StatelessWidget {
  const VerificationCodeGenerator({super.key});

  void _copy(CopyTextIntent intent) {
    debugPrint('Content copied');
    Clipboard.setData(const ClipboardData(text: '1112223334444'));
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        CopyTextIntent: CallbackAction<CopyTextIntent>(onInvoke: _copy)
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Press Ctrl-C to Copy'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CopyableText(text: '111'),
              SizedBox(
                width: 5,
              ),
              CopyableText(text: '222'),
              SizedBox(
                width: 5,
              ),
              CopyableText(text: '333'),
            ],
          ),
        ],
      ),
    );
  }
}
