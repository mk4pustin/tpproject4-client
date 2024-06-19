enum UserRole {
  Admin,
  Freelancer,
  Customer,
  Guest,
}

UserRole getUserRoleFromString(String? role) {
  return UserRole.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == role?.toLowerCase(),
    orElse: () => UserRole.Guest,
  );
}