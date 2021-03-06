import 'package:flutter/material.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';
import 'package:tic_tac_toe/src/presentation/shared/gradient_scaffold.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  static const route = '/rules';

  static const _style = TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Rules',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '• You can only draw on empty tiles',
                    style: _style,
                  ),
                  Text(
                    '• 3 match in a row wins',
                    style: _style,
                  ),
                  Text(
                    '• 3 match in a column  wins',
                    style: _style,
                  ),
                  Text(
                    '• 3 match in a diagonal  wins',
                    style: _style,
                  ),
                  Text(
                    '• You can never defeat the hard bot :)',
                    style: _style,
                  ),
                ],
              ),
            ),
            Assets.images.rule.image(),
          ],
        ),
      ),
    );
  }
}
