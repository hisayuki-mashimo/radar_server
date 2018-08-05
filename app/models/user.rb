class User < ApplicationRecord
    has_many :parameters, class_name: 'UserParameter'
end
