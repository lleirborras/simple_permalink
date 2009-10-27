require "core_ext"

class << ActiveRecord::Base
  def permalink( attr )
    class_eval <<-EOF, __FILE__, __LINE__
      before_validation do |r|
        if !r.#{attr}.nil? && r.permalink.nil?
          total = count(:conditions => {:permalink => r.#{attr}.to_url})
          r.permalink = r.#{attr}.to_url + unless total.zero?: "-" + total.next.to_s end  
        end
      end
      validates_presence_of :permalink
      validates_uniqueness_of :permalink
    EOF
  end
end