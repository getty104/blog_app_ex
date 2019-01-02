defmodule BlogAppWeb.Blogs.Scalars.UUID do
  defmacro __using__(_) do
    quote do
      scalar :uuid do
        description("UUID")

        parse(
          &{:ok,
           &1.value
           |> Base.decode16!(case: :lower)
           |> Base.hex_decode32!(case: :lower)
           |> Base.decode64!()
           |> String.to_integer(31)
           |> :math.pow(0.5)
           |> round}
        )

        serialize(
          &(&1
            |> :math.pow(2)
            |> round
            |> Integer.to_string(31)
            |> Base.encode64()
            |> Base.hex_encode32(case: :lower)
            |> Base.encode16(case: :lower))
        )
      end
    end
  end
end
