// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';

void main() {
  testWidgets('Baseline - control test', (WidgetTester tester) async {
    await tester.pumpWidget(
      new Center(
        child: new DefaultTextStyle(
          style: new TextStyle(
            fontFamily: 'Ahem',
            fontSize: 100.0,
          ),
          child: new Text('X'),
        ),
      ),
    );
    expect(tester.renderObject<RenderBox>(find.text('X')).size, const Size(100.0, 100.0));
  });

  testWidgets('Baseline - position test', (WidgetTester tester) async {
    await tester.pumpWidget(
      new Center(
        child: new Baseline(
          baseline: 180.0,
          baselineType: TextBaseline.alphabetic,
          child: new DefaultTextStyle(
            style: new TextStyle(
              fontFamily: 'Ahem',
              fontSize: 100.0,
            ),
            child: new Text('X'),
          ),
        ),
      ),
    );
    expect(tester.renderObject<RenderBox>(find.text('X')).size, const Size(100.0, 100.0));
    expect(tester.renderObject<RenderBox>(find.byType(Baseline)).size, const Size(100.0, 200.0));
  });
}
