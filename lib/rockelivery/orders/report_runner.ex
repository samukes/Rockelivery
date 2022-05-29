defmodule Rockelivery.Orders.ReportRunner do
  @moduledoc false

  use GenServer

  require Logger

  alias Rockelivery.Orders.Report

  # Client

  def start_link(_initial_stack) do
    Logger.info("Reporting runner started...")

    schedule_report_generation()

    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating report...")

    Report.create()

    {:noreply, state}
  end

  def schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
