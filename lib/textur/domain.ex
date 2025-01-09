defmodule Textur.Domain do
  use Ash.Domain

  resources do
    resource Textur.Domain.Text do
      define :create_text, action: :create
    end
  end
end
