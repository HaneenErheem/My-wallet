import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pref/shared_pref_controller.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notification=false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          children: [
            Text('Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 270,),
           IconButton(onPressed: () async{
             await _confirmLogout();
           },
               icon: Icon(Icons.logout, color: (Color(0xFF162a40)),),
           ),
          ],
        ),
        SizedBox(height: 20,),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Notifications'),
            subtitle: Text('Enable/Disable notifications'),
            value: _notification,
            onChanged: (bool value){
            setState(() => _notification=value);
            }
        ),
        SizedBox(height: 20,),
                Row(
          children: [
            Text('Change Password',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 270,),
           IconButton(onPressed: () async{
            //  Navigator.pushNamed(context, routeName)
           },
               icon: Icon(Icons.lock, color: (Color(0xFF162a40)),),
           ),
          ],
        ),
         SizedBox(height: 20,),
                Row(
          children: [
            Text('Call us',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 270,),
           IconButton(onPressed: () async{
             await _confirmLogout();
           },
               icon: Icon(Icons.call, color: (Color(0xFF162a40)),),
           ),
          ],
        ),
         SizedBox(height: 20,),
                Row(
          children: [
            Text('about Us',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 270,),
           IconButton(onPressed: () async{
          Navigator.pushNamed(context, '/about_us_screen' );
           },
               icon: Icon(Icons.info, color: (Color(0xFF162a40)),),
           ),
          ],
        ),
         SizedBox(height: 20,),
                Row(
          children: [
            Text('Help',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 270,),
           IconButton(onPressed: () async{
             await _confirmLogout();
           },
               icon: Icon(Icons.question_mark, color: (Color(0xFF162a40)),),
           ),
          ],
        ),


      ],
    );
  }
  Future<void> _confirmLogout() async{
    bool? loggedOut = await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.logout,
              style: GoogleFonts.crimsonText(
                  color: Color(0xFF162a40),
                  // fontWeight: FontWeight.w200,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              AppLocalizations.of(context)!.are_you_sure,
              style: GoogleFonts.crimsonText(
                  color: Color(0xFFa35c6e),
                  // fontWeight: FontWeight.w200,
                  fontSize: 15
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context,true);
                },
                child:  Text(AppLocalizations.of(context)!.yes,
                  style: GoogleFonts.crimsonText(
                      color: Color(0xFF162a40),
                      // fontWeight: FontWeight.w200,
                      fontSize: 15
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context,false);
                },
                child:  Text(AppLocalizations.of(context)!.no,
                  style: GoogleFonts.crimsonText(
                      color: Color(0xFF162a40),
                      // fontWeight: FontWeight.w200,
                      fontSize: 15
                  ),
                ),
              ),
            ],
          );
        }
    );
    if(loggedOut ?? false){
      await logout();
    }
  }
  Future<void> logout() async {
    bool cleared= await SharedPrefController().claer();
    if(cleared){
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
  }
}
// IconButton(
// onPressed: () async {
// await _confirmLogout();
// },
// icon: Icon(Icons.logout, color: (Color(0xFF162a40)),),
// )