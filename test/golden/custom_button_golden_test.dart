import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_event_bus_chat/widgets/custom_button.dart';

void main(){
  testGoldens('CustomButton golden test', (tester) async{
    final builder = GoldenBuilder.column()
        ..addScenario('default',
        CustomButton(label:'Click Here', onPressed:(){}))
      ..addScenario('long text',
          CustomButton(label:'Click Here long test', onPressed:(){}))

        await tester.pumpWidgetBuilder(builder.build());
        await screenMatchesGolden(tester,'custom_button_states');
  });
}