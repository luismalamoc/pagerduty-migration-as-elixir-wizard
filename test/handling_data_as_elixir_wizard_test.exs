defmodule HandlingDataAsElixirWizardTest do
  use ExUnit.Case
  doctest HandlingDataAsElixirWizard

  test "greets the world" do
    assert HandlingDataAsElixirWizard.hello() == :world
  end
end
