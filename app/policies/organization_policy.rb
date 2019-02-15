class OrganizationPolicy
  # allow creation to any logged in user
  allow_create { acting_user }

  allow_update { users.include? acting_user }

  allow_destroy { false }
end