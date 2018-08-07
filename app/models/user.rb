class User < ApplicationRecord
    has_many :parameters, class_name: 'UserParameter'

    def getParameters(type_id:)
        parameters = MasterParameter.where(type_id: type_id)
        parameter_ids = []
        parameters.each do | paramster |
            parameter_ids.push(paramster.id)
        end
        self::parameters.where(user_id: id).where(parameter_id: parameter_ids)
    end
end
