defmodule ROS.MasterMonitor do
  use GenServer
  require Logger

  alias ROS.MasterApi
  alias ROS.RPC

  @timeout 300_000
  @check_interval 1_000
  @rosout_node "/rosout"
  @caller_id :ros_master_monitor

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    # Logger.info("Starting ROS Master monitor by tracking '#{@rosout_node}'...")
    # interval = Keyword.get(opts, :check_interval, 1_000) # 1 second
    Logger.info("ROS.MasterMonitor starting. Waiting for ROS Master for up to #{@timeout / 1000} seconds...")
    case wait_for_rosout(@timeout, @check_interval) do
      {:ok, uri, pid} ->
        Logger.info("Successfully connected to #{@rosout_node} (PID: #{pid}). Monitoring has started.")
        schedule_next_check()
        {:ok, %{rosout_uri: uri, rosout_pid: pid, initialized: true}}

      {:error, reason} ->
        Logger.error("Failed to connect to ROS Master within the timeout. Reason: #{inspect(reason)}")
        {:stop, :initial_connection_failed}
    end
    # send(self(), :attempt_initial_connection)
    # {:ok, %{rosout_uri: nil, rosout_pid: nil, initialized: false}}
    # with {:ok, [1, _, uri]} <- MasterApi.lookup_node(@caller_id, @rosout_node),
    #      {:ok, [1, _, pid]} <- RPC.call(uri, "getPid", [Atom.to_string(@caller_id)]) do
    #   Logger.info("Successfully connected to #{@rosout_node} (PID: #{pid}, URI: #{uri}). Monitoring has started.")
    #   schedule_next_check()
    #   {:ok, %{rosout_uri: uri, rosout_pid: pid}}
    # else
    #   error ->
    #     Logger.error("Could not establish initial connection to #{@rosout_node}. Is roscore running? Error: #{inspect(error)}")
    #     {:stop, :initial_connection_failed}
    # end
  end

  @impl true
  def handle_info(:attempt_initial_connection, state) do
    case check_rosout_status() do
      {:ok, uri, pid} ->
        # Success! Store the baseline and start the regular checks.
        Logger.info("Successfully connected to #{@rosout_node} (PID: #{pid}, URI: #{uri}). Monitoring has started.")
        schedule_next_check()
        {:noreply, %{rosout_uri: uri, rosout_pid: pid, initialized: true}}

      {:error, reason} ->
        # Failure. Log it and schedule another attempt.
        Logger.warning("Could not connect to #{@rosout_node}, retrying in #{@check_interval}ms. Reason: #{inspect(reason)}")
        Process.send_after(self(), :attempt_initial_connection, @check_interval)
        {:noreply, state}
    end
  end

  @impl true
  def handle_info(:check_master, %{initialized: true} = state) do
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

  # defp check_rosout_status() do
  #   with {:ok, [1, _, uri]} <- MasterApi.lookup_node(@caller_id, @rosout_node),
  #        {:ok, [1, _, pid]} <- RPC.call(uri, "getPid", [Atom.to_string(@caller_id)]) do
  #     {:ok, uri, pid}
  #   else
  #     # Any failure in the chain results in an error
  #     error -> {:error, error}
  #   end
  # end

  defp wait_for_rosout(timeout, interval) when timeout > 0 do
    case check_rosout_status() do
      {:ok, uri, pid} ->
        {:ok, uri, pid}

      {:error, _reason} ->
        Process.sleep(interval)
        wait_for_rosout(timeout - interval, interval)
    end
  end
  defp wait_for_rosout(_timeout, _interval), do: {:error, :timeout}

  defp check_rosout_status() do
    try do
      with {:ok, [1, _, uri]} <- MasterApi.lookup_node(@caller_id, @rosout_node),
           {:ok, [1, _, pid]} <- RPC.call(uri, "getPid", [Atom.to_string(@caller_id)]) do
        {:ok, uri, pid}
      else
        error -> {:error, error}
      end
    rescue
      e in RuntimeError -> {:error, e}
    end
  end

  defp schedule_next_check() do
    Process.send_after(self(), :check_master, @check_interval)
  end
end
