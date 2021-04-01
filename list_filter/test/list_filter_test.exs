defmodule ListFilterTest do
  use ExUnit.Case
  test "count list odd values" do
    expected_vaule = 3
    list = ["1","2","3","5"]
    assert ListFilter.call(list) == expected_vaule
  end
end
