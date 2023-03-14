
  import 'dart:io';

import 'package:flutter/material.dart';

import '../../../routes.dart';

AppBar PickImageAppBar(BuildContext context,List<File> images) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Select Images')),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              if (images.isEmpty) {
                Navigator.pop(context);
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'You have selected pictures already. Do you want to discard post'),
                    // content: Text('data'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('Ok')),
                    ],
                  ),
                );
              }
            },
            icon: const Icon(Icons.close_rounded)),
        actions: [
          IconButton(
              onPressed: () {
                if (images.isNotEmpty) {
                  Navigator.pushNamed(context, addRouteName);
                } else {
                  //TODO: show dialog
                }
              },
              icon: const Icon(Icons.arrow_forward_rounded))
        ],
      );
  }

