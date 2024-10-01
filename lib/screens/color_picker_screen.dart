import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task_state_management_2/provider/theme.dart';

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Provider'),
        actions: [
          IconButton(
              onPressed: () {
                _openColorPicker(context);
              },
              icon: const Icon(Icons.colorize))
        ],
        backgroundColor: theme.pickerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(dummyText,style: TextStyle(fontSize: 20,color: theme.pickerColor),),
          const Gap(32),
          CircleAvatar(
            backgroundColor: theme.pickerColor,
            radius: 50,
          )
        ],),
      ),
    );
  }
}

void _openColorPicker(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: Consumer<ThemeProvider>(
              builder: (context, theme, child) {
                return ColorPicker(
                  pickerColor: theme.pickerColor,
                  onColorChanged: (color) {
                    theme.onColorChanged(color);
                  },
                );
              },
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

const dummyText = '''The first page “Login Page” should 
have 2x TextFields to enter the email and password
have a button “Sign In” to login into the app and navigate to the second page

The second page “User Info” should
display the email of the logged in user
stay logged in in the “User Info” page even if we close the app and then open it again, it should still go to the “User Info” page (use “Shared Preferences” package)
have a button “Sign Out” and when the user clicks on it we should go back to the Login page and stay there even if we close the app and open it again. 
''';