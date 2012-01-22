require 'test_helper'

class TimeAccessorTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, TimeAccessor
  end
  
  test "should set time attribute with multiparameters" do
    time = Time.now
    time2 = 2.hours.from_now
    user = User.new({
      "time(1i)" => time.year, "time(2i)" => time.month, "time(3i)" => time.mday, "time(4i)" => time.hour, "time(5i)" => time.min, "time(6i)" => time.sec,
      "time2(1i)" => time2.year, "time2(2i)" => time2.month, "time2(3i)" => time2.mday, "time2(4i)" => time2.hour, "time2(5i)" => time2.min, "time2(6i)" => time2.sec
    })
    [:year, :month, :mday, :hour, :min, :sec].each do |method_name|
      assert_equal time.send(method_name), user.time.send(method_name)
      assert_equal time2.send(method_name), user.time2.send(method_name)
    end
  end
  
end
