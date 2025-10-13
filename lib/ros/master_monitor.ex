defmodule ROS.MasterMonitor do
  use GenServer
  require Logger

  alias ROS.MasterApi
  alias ROS.RPC

  @check_interval 1_000
  @rosout_node "/rosout"
  @caller_id :ros_master_monitor

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    Logger.info("Starting ROS Master monitor by tracking '#{@rosout_node}'...")

    with {:ok, [1, _, uri]} <- MasterApi.lookup_node(@caller_id, @rosout_node),
         {:ok, [1, _, pid]} <- RPC.call(uri, "getPid", [Atom.to_string(@caller_id)]) do
      Logger.info("Successfully connected to #{@rosout_node} (PID: #{pid}, URI: #{uri}). Monitoring has started.")
      schedule_next_check()
      {:ok, %{rosout_uri: uri, rosout_pid: pid}}
    else
      error ->
        Logger.error("Could not establish initial connection to #{@rosout_node}. Is roscore running? Error: #{inspect(error)}")
        {:stop, :initial_connection_failed}
    end
  end

  @impl true
  def handle_info(:check_master, state) do
    case check_rosout_status() do
      {:ok, new_uri, new_pid} ->
        cond do
          new_uri != state.rosout_uri ->
            Logger.error("ROS Master has restarted. '#{@rosout_node}' URI changed. Triggering restart.")
            {:stop, :normal, state}

          new_pid != state.rosout_pid ->
            Logger.error("ROS Master has restarted. '#{@rosout_node}' PID changed. Triggering restart.")
            {:stop, :normal, state}

          true ->
            # Everything is normal, schedule the next check
            schedule_next_check()
            {:noreply, state}
        end

      {:error, reason} ->
        Logger.error("Failed to contact ROS Master or '#{@rosout_node}'. Reason: #{inspect(reason)}. Triggering restart.")
        {:stop, :normal, state}
    end
  end

  defp check_rosout_status() do
    with {:ok, [1, _, uri]} <- MasterApi.lookup_node(@caller_id, @rosout_node),
         {:ok, [1, _, pid]} <- RPC.call(uri, "getPid", [Atom.to_string(@caller_id)]) do
      {:ok, uri, pid}
    else
      # Any failure in the chain results in an error
      error -> {:error, error}
    end
  end

  defp schedule_next_check() do
    Process.send_after(self(), :check_master, @check_interval)
  end
end
