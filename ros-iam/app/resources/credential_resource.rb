# frozen_string_literal: true

class CredentialResource < Iam::ApplicationResource
  attributes :access_key_id, :schema_name, :owner_type, :owner_id
  filter :access_key_id
end

