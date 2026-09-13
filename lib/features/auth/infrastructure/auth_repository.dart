import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../domain/app_user.dart';
import '../domain/auth_exception.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final supabase.SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Stream<AppUser?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map((event) {
      final user = event.session?.user;
      return user != null ? AppUser.fromSupabase(user) : null;
    });
  }

  AppUser? get currentUser {
    final user = _supabase.auth.currentUser;
    return user != null ? AppUser.fromSupabase(user) : null;
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
    } on supabase.AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw const AuthException('An unexpected error occurred during login.');
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await _supabase.auth.signUp(email: email, password: password);
    } on supabase.AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw const AuthException('An unexpected error occurred during registration.');
    }
  }

  Future<void> signInWithOAuth(supabase.OAuthProvider provider) async {
    try {
      await _supabase.auth.signInWithOAuth(provider);
    } catch (e) {
      throw const AuthException('Failed to initialize OAuth login.');
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(supabase.Supabase.instance.client);
}
