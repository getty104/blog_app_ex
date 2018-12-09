defmodule BlogAppWeb.Admins.BlogView do
  use BlogAppWeb, :view

  def parse_markdown(markdown) do
    Earmark.as_html!(markdown)
  end
end
