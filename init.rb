require "core_ext"

class << ActiveRecord::Base
  def permalink( attr )
    class_eval <<-EOF, __FILE__, __LINE__
      before_save { |r| r.permalink = r.#{attr}.to_url }
    EOF
  end
end


