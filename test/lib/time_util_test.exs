defmodule TimeUtilTest do
  use ExUnit.Case, async: true

  test "duration_hms" do
    assert TimeUtil.duration_hms(3180) == "00:53:00"
    assert TimeUtil.duration_hms(7200) == "02:00:00"
    assert TimeUtil.duration_hms(2) == "00:00:02"
    assert TimeUtil.duration_hms(9001) == "02:30:01"
  end
end
