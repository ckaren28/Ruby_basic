class Dojo < ActiveRecord::Base
    has_many :ninjas dependent: :destroy
    validates :name, :city, :state, presence:true, on: :create
    validates :state, length:{minimum: 2}

    # before_destroy :destroy_ninjas
    #
    # private
    #     def destroy_ninjas
    #         puts "got here"
    #         self.ninjas.destroy_all "#{id} = dojo_id"
    #     end

end
