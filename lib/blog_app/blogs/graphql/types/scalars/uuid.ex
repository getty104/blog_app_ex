defmodule BlogAppWeb.Blogs.Scalars.UUID do
  defmacro __using__(_) do
    quote do
      scalar :uuid do
        description("UUID")

        parse(&parse_value/1)

        serialize(&serialize_value/1)
      end

      defp parse_value(data) do
        try do
          {:ok,
           data.value
           |> Base.decode16!(case: :lower)
           |> Base.hex_decode32!(case: :lower)
           |> Base.decode64!()
           |> String.to_integer(31)
           |> :math.pow(0.5)
           |> round}
        rescue
          e -> :error
        end
      end

      defp serialize_value(value) do
        value
        |> :math.pow(2)
        |> round
        |> Integer.to_string(31)
        |> Base.encode64()
        |> Base.hex_encode32(case: :lower)
        |> Base.encode16(case: :lower)
      end
    end
  end
end
