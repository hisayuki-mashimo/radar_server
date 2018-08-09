class ApiController < ApplicationController
  protect_from_forgery except: :get_parameter
  skip_before_action :verify_authenticity_token, if: :json_request?

  def params
    @params ||= JSON.parse(request.body.read, {:symbolize_names => true})
  end

  def get_user
    user = User.find(params[:user_id].to_i)
    #raise
    user_parameters = user.getParameters(type_id: params[:parameter_type_id].to_i)
    @parameters = []
    user_parameters.each do | user_parameter |
      @parameters.push(user_parameter.parameter)
    end

    respond_to do | format |
      format.json { render json: @parameters }
    end
  end

  def get_parameter
    require 'digest/md5'

    parameter_type_code = params[:parameter_type] ? params[:parameter_type].to_i : 1
    parameter_type_id = _get_parameter_id parameter_type_code
    parameter_type = MasterParameterType.find(parameter_type_id)
    parameters = parameter_type.getParameters
    first_name = params[:first_name].to_s
    last_name = params[:last_name].to_s

    hash_1 = Digest::MD5.new.update(first_name + '=' + last_name).to_s
    hash_2 = Digest::MD5.new.update(last_name + '=' + first_name).to_s
    hash = hash_1 + hash_2
    strings = hash.split ""

    @user_parameters = []

    parameters.each_with_index do | parameter, i |
      integer = 1

      [0, 1].each do | j |
        n = (i * 2) + j
        string = strings[n]
        unit_integer = 0

        case j
          when 0 then
            case true
              when string.match(/[0-9]/) != nil then unit_integer = string.to_i
              when string.match(/[a-b]/) != nil then unit_integer = 0 # weight: 2
              when string.match(/[c-d]/) != nil then unit_integer = 1 # weight: 2
              when string.match(/[e-g]/) != nil then unit_integer = 2 # weight: 3
              when string.match(/[h-j]/) != nil then unit_integer = 3 # weight: 3
              when string.match(/[k-m]/) != nil then unit_integer = 4 # weight: 3
              when string.match(/[n-p]/) != nil then unit_integer = 5 # weight: 3
              when string.match(/[q-s]/) != nil then unit_integer = 6 # weight: 3
              when string.match(/[t-v]/) != nil then unit_integer = 7 # weight: 3
              when string.match(/[w-x]/) != nil then unit_integer = 8 # weight: 2
              when string.match(/[y-z]/) != nil then unit_integer = 9 # weight: 2
            end
            integer += unit_integer
          when 1 then
            case true
              when string.match(/[0-9]/) != nil then unit_integer = string.to_i
              when string.match(/a/) != nil then unit_integer = 0 # weight: 1
              when string.match(/b/) != nil then unit_integer = 1 # weight: 1
              when string.match(/[c-d]/) != nil then unit_integer = 2 # weight: 2
              when string.match(/[e-h]/) != nil then unit_integer = 3 # weight: 4
              when string.match(/[i-m]/) != nil then unit_integer = 4 # weight: 5
              when string.match(/[n-r]/) != nil then unit_integer = 5 # weight: 5
              when string.match(/[s-v]/) != nil then unit_integer = 6 # weight: 4
              when string.match(/[w-x]/) != nil then unit_integer = 7 # weight: 2
              when string.match(/y/) != nil then unit_integer = 8 # weight: 1
              when string.match(/z/) != nil then unit_integer = 9 # weight: 1
            end
            integer += unit_integer * 10
        end
      end
    
      @user_parameters.push(integer)
    end

    respond_to do | format |
      format.json { render json: @user_parameters }
    end
  end

  def _get_parameter_id (parameter_type_code)
    case parameter_type_code
      when 4 then 2
      when 6 then 3
      when 8 then 1
      when 12 then 4
      when 20 then 5
      end
  end
end
