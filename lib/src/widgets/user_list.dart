import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/controllers/user_controller.dart';
import 'package:flutter_application/src/widgets/user_profile_card.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListState = ref.watch(userListControllerProvider);

    return userListState.when(
      data: (users) {
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(userListControllerProvider.notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return UserProfileCard(user: user);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('에러가 발생했습니다: $error'),
            ElevatedButton(
              onPressed: () =>
                  ref.read(userListControllerProvider.notifier).refresh(),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
    );
  }
}
