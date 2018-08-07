class ApiController < ApplicationController
  def get_user
    user = User.find(params[:user_id].to_i)
    #raise
    user_parameters = user.getParameters(type_id: params[:parameter_type_id].to_i)
    @parameters = []
    user_parameters.each do | user_parameter |
      @parameters.push(user_parameter.parameter)
    end

    p @parameters
    respond_to do | format |
      format.json { render json: @parameters }
    end
  end
end
