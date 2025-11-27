import 'package:flutter/material.dart';

import '../domain/session_model.dart';

class SessionDetailScreen extends StatelessWidget {
  final SessionModel session;

  const SessionDetailScreen({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détail Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Nom: ${session.name}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 12),
            Text('Créé le: ${session.createdAt}'),
          ],
        ),
      ),
    );
  }
}
