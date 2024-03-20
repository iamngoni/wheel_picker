//
//  wheel_picker
//  options_tab
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

class OptionsTab<T> extends StatelessWidget {
  const OptionsTab({
    required this.item,
    required this.items,
    required this.onItemChanged,
    super.key,
  });

  final T item;
  final List<T> items;
  final void Function(T) onItemChanged;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(5),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: context.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: items.map<Widget>((i) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onItemChanged(i);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: sy(2),
                        horizontal: sx(5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: sx(20),
                        vertical: sy(3),
                      ),
                      decoration: BoxDecoration(
                        color: item == i ? Colors.white : null,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: item == i
                            ? [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: sy(8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
