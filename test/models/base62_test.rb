require "test_helper"

class Base62Test < ActiveSupport::TestCase
  test "encode 0"  do
    assert_equal "0", Base62.encode(0)
  end

  test "encode 1"  do
    assert_equal "1", Base62.encode(1)
  end

  test "encode 10"  do
    assert_equal "a", Base62.encode(10)
  end

  test "encode 1024" do
    assert_equal "gw", Base62.encode(1024)
  end
end
