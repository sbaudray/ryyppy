defmodule AuthorTest do
  use ExUnit.Case

  alias Ryyppy.Author

  describe("from_string") do
    test "returns the author" do
      assert Author.from_string("ryyppy") == %Author{media: nil, name: "ryyppy"}
    end

    test "returns the author and the social media" do
      assert Author.from_string("github.com/ryyppy") == %Author{media: "github", name: "ryyppy"}
    end

    test "errors on invalid medias" do
      assert catch_error(Author.from_string("invalid.com/ryyppy"))
    end

    test "errors on empty string" do
      assert catch_error(Author.from_string(""))
    end
  end
end
