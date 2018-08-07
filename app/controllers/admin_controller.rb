class AdminController < ApplicationController
    def user_list
        parameter_type_id = params[:type] ? params[:type].to_i : 1
        @parameter_type = MasterParameterType.find(parameter_type_id)
        @parameters = @parameter_type.getParameters()

        @page = params[:page] ? params[:page].to_i : 1
        limit = 4
        offset = limit * (@page - 1)

        users = User.limit(limit).offset(offset)

        @user_infos = []

        users.each do | user |
            @user_infos.push({
                embody: user,
                parameters: user.getParameters(type_id: @parameter_type.id)
            })
        end
        p @user_infos
    end
end
