class ComplaintAddress < ActiveRecord::Base
  belongs_to :address
  belongs_to :complaint

end
