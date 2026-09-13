import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  final String id;
  final String email;

  const AppUser({
    required this.id,
    required this.email,
  });

  factory AppUser.fromSupabase(User user) {
    return AppUser(
      id: user.id,
      email: user.email ?? '',
    );
  }
}
