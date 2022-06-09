import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/generated/l10n.dart';

class AppLocaleScreen extends StatefulWidget {
  const AppLocaleScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppLocaleScreen> createState() => _AppLocaleScreenState();
}

class _AppLocaleScreenState extends State<AppLocaleScreen> {
  @override
  void initState() {
    super.initState();
  }

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).auth),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text("${S.of(context).language}: "),
                Flexible(
                  child: InputDecorator(
                    decoration: const InputDecoration(),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3,
                      isDense: true,
                      value: Intl.getCurrentLocale(),
                   
                      items: [
                        DropdownMenuItem<String>(
                          value: 'en',
                          child: Text(
                            S.of(context).english,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'ru_RU',
                          child: Text(
                            S.of(context).russian,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                      onChanged: (lang) async {
                        if (lang == 'ru_RU') {
                          await S.load(const Locale('ru', 'RU'));
                        } else {
                          await S.load(const Locale('en'));
                        }

                        setState(() {});
                      },
                    )),
                  ),
                ),
              ],
            ),
            Text(
              "${S.of(context).counterValue} $counter",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() async {
    setState(() {
      counter++;
    });
  }
}
