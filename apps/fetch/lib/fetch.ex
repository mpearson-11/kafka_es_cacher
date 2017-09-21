defmodule RequestStruct do
  defstruct [url: nil, options: nil]
end

defmodule Fetch do
  defp after_request(response, then) do
    then.(response)
  end
  defp error_check(%HTTPotion.ErrorResponse{message: message}) do
    {:halt, message}
  end
  defp error_check(response) do
    if HTTPotion.Response.success?(response) == true do
      {:ok, response.body}
    else
      {:halt, response.status_code}
    end
  end

  defp get_request(%RequestStruct{url: url, options: nil}) do
    HTTPotion.get(url)
  end

  # options
  defp get_request(%RequestStruct{url: url, options: options}) do
    HTTPotion.get(url, options)
  end

  def get(%{
    "url" => url,
    "options" => options
  }, then) do
    %RequestStruct{url: url, options: options}
    |> get_request
    |> error_check
    |> after_request(then)
  end

  def get(%{
    "url" => url
  }, then) do
    %RequestStruct{url: url}
    data = url
    |> get_request
    |> error_check
    |> after_request(then)
  end
end
