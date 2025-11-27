import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'session_view_model.dart';
import 'session_detail_screen.dart';
import 'session_recording_screen.dart';

class SessionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SessionViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sessions')),
      body: FutureBuilder(
        future: viewModel.loadSessions(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: viewModel.sessions.length,
            itemBuilder: (context, index) {
              final session = viewModel.sessions[index];
              return ListTile(
                title: Text(session.name),
                subtitle: Text(session.createdAt.toIso8601String()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SessionDetailScreen(session: session),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SessionRecordingScreen()),
          );
          // Simule l'ajout d'une session
          // await viewModel.addSession('Nouvelle session ${DateTime.now()}');
        },
        label: Text('Démarrer un enregistrement'),
        icon: Icon(Icons.play_arrow),
      ),
    );
  }
}
