require "core_ext"

class << ActiveRecord::Base
  def permalink( attr )
    class_eval <<-EOF, __FILE__, __LINE__
      before_validation { |r| r.permalink = r.#{attr}.to_url if !r.#{attr}.nil? && r.permalink.nil? }
    EOF
  end
end


