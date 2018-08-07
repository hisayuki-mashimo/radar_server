class MasterParameterType < ApplicationRecord
    has_many :parameters, class_name: 'MasterParameter', foreign_key: 'type_id'

    def getParameters()
        self.parameters.find_all()
    end
end
