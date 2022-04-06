// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

showConfirmDialog(
    BuildContext context,
    String heading,
    String message,
    String buttonAcceptTitle,
    Function acceptFunction,
    String buttonCancelTitle,
    Function denyFunction,
    ) {
  // set up the buttons
  Widget cancelButton = OutlinedButton(
    child: Text(buttonCancelTitle),
    onPressed: () {
      denyFunction();
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text(buttonAcceptTitle),
    onPressed: () {
      acceptFunction();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      heading,
      style: TextStyle(color: Colors.deepOrange),
    ),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(
    BuildContext context,
    String heading,
    String message,
    String buttonAcceptTitle,
    // Function acceptFunction,
    // String buttonCancelTitle,
    // Function denyFunction,
    ) {
  // set up the buttons

  Widget continueButton = ElevatedButton(
    child: Text(buttonAcceptTitle),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      heading,
      style: TextStyle(color: Colors.deepOrange),
    ),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showImageDialog(
    BuildContext context,
    Image image,
    String buttonAcceptTitle,
    // Function acceptFunction,
    // String buttonCancelTitle,
    // Function denyFunction,
    ) {
  // set up the buttons

  Widget continueButton = ElevatedButton(
    child: Text(buttonAcceptTitle),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: image,
    contentPadding: EdgeInsets.all(1),
    actions: [
      Center(child: continueButton),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
