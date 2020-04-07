defmodule Ryyppy.Author do
  defstruct [:media, :name]

  @valid_medias ~w(github twitter)

  def new(fields \\ []) do
    struct(__MODULE__, fields)
  end

  def from_string(str) when is_binary(str) and byte_size(str) > 0 do
    parts = String.split(str, ".com/")

    case parts do
      [media, author] when media in @valid_medias ->
        new(media: media, name: author)

      [author] ->
        new(name: author)
    end
  end
end
