import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:one_health_hospital_app/main.dart' as app;


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Registration Testing", (tester) async{
    app.main();

    await tester.pumpAndSettle();
    
  });
}