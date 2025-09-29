defmodule ROS.RPC do
  @moduledoc """
  Minimal XML-RPC client used as a drop-in for Xenium.

  Examples:
      ROS.RPC.call!("http://localhost:11311", "getSystemState", ["/ros-elixir"])
  """

  @type url :: String.t()
  @type method :: String.t()
  @type params :: list()

  @spec call!(url, method, params) :: term()
  def call!(url, method, params \\ []) do
    method_call = %XMLRPC.MethodCall{method_name: method, params: params}
    body = XMLRPC.encode!(method_call)

    %Req.Response{status: status, body: resp_body} =
      Req.post!(url: url, headers: [{"content-type", "text/xml"}], body: body)

    if status != 200 do
      raise "XML-RPC HTTP error #{status}: #{inspect(resp_body)}"
    end

    case XMLRPC.decode(resp_body) do
      {:ok, %XMLRPC.MethodResponse{param: value}} ->
        value

      {:ok, %XMLRPC.Fault{fault_code: code, fault_string: msg}} ->
        raise "XML-RPC fault #{code}: #{msg}"

      {:error, reason} ->
        raise "XML-RPC decode error: #{inspect(reason)}"
    end
  end

  @spec call(url, method, params) :: {:ok, term()} | {:error, term()}
  def call(url, method, params \\ []) do
    {:ok, call!(url, method, params)}
  rescue
    e -> {:error, e}
  end
end
