import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  static logoutUser() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.userToken, "");
  }

  static showCustomFlushBar(String message, Color color,
      {int duration = 2500,
      int animationDuration = 300,
      Color textColor = Colors.white}) {
    BotToast.showCustomText(
        align: Alignment.bottomCenter,
        duration: Duration(milliseconds: duration),
        // wrapAnimation: AnimationController(),
        toastBuilder: (_) {
          return Container(
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                ),
              ));
        }); //popup a text toast;
  }

  static showGenericModal(
      {BuildContext context, Widget child, double padding = 16}) {
    // unfocusInputs(context);
    showGeneralDialog(
      transitionBuilder: (contextDialog, a1, a2, widget) {
        final curvedValue = Curves.easeInOut.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -600, 0.0),
          child: GestureDetector(
            onTap: () {
              navKey.currentState.pop();
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Center(
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // unfocusInputs(context);
                          },
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 400),
                              padding: EdgeInsets.all(padding),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              // width: MediaQuery.of(context).size.width * 0.9,
                              // height: MediaQuery.of(context).size.height * 0.5,
                              child: child),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: ((BuildContext context, Animation animation,
          Animation secondAnimation) {}),
    );
  }

  static String getFormatedMonthString(month) {
    switch (month) {
      case 1:
        {
          return 'Janeiro';
        }
      case 2:
        {
          return 'Fevereiro';
        }
      case 3:
        {
          return 'Março';
        }
      case 4:
        {
          return 'Abril';
        }
      case 5:
        {
          return 'Maio';
        }
      case 6:
        {
          return 'Junho';
        }
      case 7:
        {
          return 'Julho';
        }
      case 8:
        {
          return 'Agosto';
        }
      case 9:
        {
          return 'Setembro';
        }
      case 10:
        {
          return 'Outubro';
        }
      case 11:
        {
          return 'Novembro';
        }
      case 12:
        {
          return 'Dezembro';
        }
    }
    return '';
  }
}
