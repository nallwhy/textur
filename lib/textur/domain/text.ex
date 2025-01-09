defmodule Textur.Domain.Text do
  use Ash.Resource, domain: Textur.Domain

  attributes do
    uuid_v7_primary_key :id
    attribute :title, :string, allow_nil?: true
    attribute :body, :string, allow_nil?: false
    attribute :password, :string, allow_nil?: true
    attribute :public, :boolean, default: true, allow_nil?: false

    create_timestamp :created_at, type: :utc_datetime_usec
  end

  actions do
    create :create do
      accept [:title, :body, :password, :public]
    end
  end
end
