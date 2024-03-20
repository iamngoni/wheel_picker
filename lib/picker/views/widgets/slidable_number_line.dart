//
//  wheel_picker
//  slidable_number_line
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

class SlidableNumberLine extends StatefulWidget {
  const SlidableNumberLine({
    required this.spacing,
    required this.steps,
    required this.count,
    required this.multiplier,
    required this.onScrollChanged,
    super.key,
  });

  final double spacing;
  final int steps;
  final int count;
  final int multiplier;
  final void Function(double) onScrollChanged;

  @override
  State<SlidableNumberLine> createState() => _SlidableNumberLineState();
}

class _SlidableNumberLineState extends State<SlidableNumberLine> {
  final ScrollController scrollController = ScrollController();
  int get totalNumberLine {
    return widget.count * widget.multiplier;
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        log('scrollController.offset: ${scrollController.offset}');
        final double value = scrollController.offset / widget.spacing;
        log('value: $value');
        if (!value.isNegative) {
          widget.onScrollChanged(value);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(50),
          width: context.width,
          alignment: Alignment.center,
          child: Stack(
            children: [
              ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  totalNumberLine,
                  (index) {
                    final double value =
                        (index / widget.steps) * widget.multiplier;
                    final bool hasRemainder = value % widget.multiplier == 0;

                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: sx(widget.spacing)),
                      child: Column(
                        children: [
                          Container(
                            height: sy(35),
                            width: sx(1),
                            color: Colors.grey,
                          ),
                          if (hasRemainder)
                            Text(
                              '${value.toInt()}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: sy(7),
                              ),
                            )
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Container(
                  height: sy(35),
                  width: sx(1),
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
