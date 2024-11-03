// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeen/cores/cores.dart';
import 'package:skeen/features/features.dart';

final homeDatasourceProvider = Provider<HomeDatasource>(
  (ref) => HomeDatasourceImpl(
    supabaseHelper: SupabaseHelper(),
  ),
);

abstract class HomeDatasource {
  Future<List<TipsAndTricksModel>?> getTipsAndTricks();
  Future<UserModel?> getUser();
}

class HomeDatasourceImpl extends HomeDatasource {
  final SupabaseHelper supabaseHelper;

  HomeDatasourceImpl({
    required this.supabaseHelper,
  });

  @override
  Future<UserModel?> getUser() async {
    final currentUser = supabaseHelper.client.auth.currentUser;

    if (currentUser == null) return null;

    return UserModel(
      email: currentUser.email,
      fullName: currentUser.userMetadata?['full_name'],
      userId: currentUser.id,
    );
  }

  @override
  Future<List<TipsAndTricksModel>?> getTipsAndTricks() async {
    final data = await supabaseHelper.getTipsAndTricks();

    return data.map((doc) => TipsAndTricksModel.fromJson(doc)).toList();
  }
}