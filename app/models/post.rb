class Post < ActiveRecord::Base

	belongs_to :user

	validates :user_id, presence: true

	validates :content, :presence => { :message => "Content is required" }, length: { 
		minimum: 5,
		maximum: 500,
		tokenizer: lambda { |str| str.scan(/\w+/) },
        too_short: "must have at least %{count} words",
        too_long: "must have at most %{count} words",  
    }

	default_scope -> { order('created_at DESC') }  # sort posts order

end
