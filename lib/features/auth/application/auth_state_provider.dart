import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/app_user.dart';
import '../infrastructure/auth_repository.dart';

part 'auth_state_provider.g.dart';

@riverpod
Stream<AppUser?> authState(AuthStateRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges;
}
