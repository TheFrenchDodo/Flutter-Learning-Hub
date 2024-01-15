import 'package:flutter/material.dart';
import 'package:flutter_learning_hub/components/my_drawer.dart';
import 'package:flutter_learning_hub/components/my_page_builder.dart';
import 'package:flutter_learning_hub/pages/contact_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(CustomPageRoute(
                page: ContactPage(),
                curve: Curves.easeInOut,
              ));
            },
            icon: Icon(
              Icons.chat
              )
          )
        ],
      ),

      body:Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: 
            Localizations.override(
              context: context,
              locale: const Locale('fr'),
              child: Builder(
                builder: (context){
                  return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
                  );
                },
              ),
            ),
            ),
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.bold,
                //color: Colors.white, // Set the text color as per your design
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      
      drawer: const MyDrawer(),
      
    );
  }
}
