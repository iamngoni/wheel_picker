//
//  wheel_picker
//  picker
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../models/data/count.dart';
import '../../models/data/multiplier.dart';
import '../../models/data/steps.dart';
import '../widgets/options_tab.dart';
import '../widgets/slidable_number_line.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  Count count = Count.thirty;
  Steps steps = Steps.ten;
  Multiplier multiplier = Multiplier.ten;
  double spacing = 10;

  double pickerValue = 1;

  double get inPounds {
    return pickerValue * multiplier.value;
  }

  void onScrollChanged(double value) {
    setState(() {
      pickerValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: context.height,
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wheel Picker',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: sy(20),
                    ),
                  ),
                  SizedBox(
                    height: sy(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedSwitcher(
                        duration: 100.milliseconds,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, -0.2),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                        child: Text(
                          inPounds.toStringAsFixed(1),
                          key: ValueKey<double>(inPounds),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(25),
                            height: 1,
                          ),
                        ),
                      ),
                      Text(
                        ' lbs',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                          fontSize: sy(15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  SlidableNumberLine(
                    spacing: spacing,
                    steps: steps.value,
                    count: count.value,
                    multiplier: multiplier.value,
                    onScrollChanged: onScrollChanged,
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  Container(
                    width: context.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: sx(20),
                      vertical: sy(10),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COUNT',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(8),
                          ),
                        ),
                        SizedBox(
                          height: sy(5),
                        ),
                        OptionsTab(
                          item: count,
                          items: Count.values,
                          onItemChanged: (v) => setState(() => count = v),
                        ),
                        SizedBox(
                          height: sy(20),
                        ),
                        Text(
                          'STEPS',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(8),
                          ),
                        ),
                        SizedBox(
                          height: sy(5),
                        ),
                        OptionsTab(
                          item: steps,
                          items: Steps.values,
                          onItemChanged: (v) => setState(() => steps = v),
                        ),
                        SizedBox(
                          height: sy(20),
                        ),
                        Text(
                          'MULTIPLIER',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(8),
                          ),
                        ),
                        SizedBox(
                          height: sy(5),
                        ),
                        OptionsTab(
                          item: multiplier,
                          items: Multiplier.values,
                          onItemChanged: (v) => setState(() => multiplier = v),
                        ),
                        SizedBox(
                          height: sy(20),
                        ),
                        Text(
                          'SPACING',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(8),
                          ),
                        ),
                        Slider.adaptive(
                          value: spacing,
                          min: 1,
                          max: 20,
                          onChanged: (v) => setState(() {
                            spacing = v;
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
