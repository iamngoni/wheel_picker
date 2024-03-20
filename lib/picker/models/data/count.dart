//
//  wheel_picker
//  count
//
//  Created by Ngonidzashe Mangudya on 20/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

enum Count {
  ten(10),
  twenty(20),
  thirty(30);

  const Count(this.value);
  final int value;

  @override
  String toString() {
    return value.toString();
  }
}
