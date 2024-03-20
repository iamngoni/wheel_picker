//
//  wheel_picker
//  steps
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

enum Steps {
  five(5),
  ten(10);

  const Steps(this.value);
  final int value;

  @override
  String toString() {
    return value.toString();
  }
}
