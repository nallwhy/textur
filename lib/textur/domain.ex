defmodule Textur.Domain do
  use Ash.Domain

  resources do
    resource Textur.Domain.Text do
      define :list_texts, action: :list
      define :get_text_by_id, action: :get_by_id, args: [:id]
      define :create_text, action: :create
    end
  end
end
