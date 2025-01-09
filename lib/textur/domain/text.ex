defmodule Textur.Domain.Text do
  use Ash.Resource,
    domain: Textur.Domain,
    data_layer: AshSqlite.DataLayer

  attributes do
    uuid_v7_primary_key :id
    attribute :title, :string, allow_nil?: true
    attribute :body, :string, allow_nil?: false
    attribute :password, :string, allow_nil?: false
    attribute :private, :boolean, default: false, allow_nil?: false
    attribute :private_password, :string, allow_nil?: true

    create_timestamp :created_at, type: :utc_datetime_usec
  end

  actions do
    create :create do
      accept [:title, :body, :password, :private]
    end
  end

  validations do
    validate attributes_present([:private_password]), where: attribute_equals(:private, true)
    validate attribute_equals(:private, true), where: attributes_present([:private_password])
  end

  sqlite do
    table "texts"
    repo Textur.Repo
  end
end
