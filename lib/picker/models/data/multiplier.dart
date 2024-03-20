//
//  wheel_picker
//  multiplier
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

enum Multiplier {
  one(1),
  ten(10);

  const Multiplier(this.value);
  final int value;

  @override
  String toString() {
    return value.toString();
  }
}
