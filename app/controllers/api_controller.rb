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

  def get_parameter
    require 'digest/md5'

    parameter_type = MasterParameterType.find(params[:parameter_type_id].to_i)
    parameters = parameter_type.getParameters
    first_name = params[:first_name]
    last_name = params[:last_name]

    hash_1 = Digest::MD5.new.update(first_name + '=' + last_name).to_s
    hash_2 = Digest::MD5.new.update(last_name + '=' + first_name).to_s
    hash = hash_1 + hash_2
    stings = hash.split ""

    user_parameters = []

    parameters.each_with_index do | i, parameter |
      let integer = 1;

      [0, 1].each do | j |
        n = (i * 2) + j

        =begin
        switch (j) {
          case 0:
            switch (true) {
              case (strings[n].match(/[0-9]/) !== null): var unit_integer = parseInt(strings[n]); break;
              case (strings[n].match(/[a-b]/) !== null): var unit_integer = 0; break; // weight: 2
              case (strings[n].match(/[c-d]/) !== null): var unit_integer = 1; break; // weight: 2
              case (strings[n].match(/[e-g]/) !== null): var unit_integer = 2; break; // weight: 3
              case (strings[n].match(/[h-j]/) !== null): var unit_integer = 3; break; // weight: 3
              case (strings[n].match(/[k-m]/) !== null): var unit_integer = 4; break; // weight: 3
              case (strings[n].match(/[n-p]/) !== null): var unit_integer = 5; break; // weight: 3
              case (strings[n].match(/[q-s]/) !== null): var unit_integer = 6; break; // weight: 3
              case (strings[n].match(/[t-v]/) !== null): var unit_integer = 7; break; // weight: 3
              case (strings[n].match(/[w-x]/) !== null): var unit_integer = 8; break; // weight: 2
              case (strings[n].match(/[y-z]/) !== null): var unit_integer = 9; break; // weight: 2
            }
    
            var coefficient = 1;
            break;
    
          case 1:
            switch (true) {
              case (strings[n].match(/[0-9]/) !== null): var unit_integer = parseInt(strings[n]); break;
              case (strings[n].match(/a/) !== null): var unit_integer = 0; break; // weight: 1
              case (strings[n].match(/b/) !== null): var unit_integer = 1; break; // weight: 1
              case (strings[n].match(/[c-d]/) !== null): var unit_integer = 2; break; // weight: 2
              case (strings[n].match(/[e-h]/) !== null): var unit_integer = 3; break; // weight: 4
              case (strings[n].match(/[i-m]/) !== null): var unit_integer = 4; break; // weight: 5
              case (strings[n].match(/[n-r]/) !== null): var unit_integer = 5; break; // weight: 5
              case (strings[n].match(/[s-v]/) !== null): var unit_integer = 6; break; // weight: 4
              case (strings[n].match(/[w-x]/) !== null): var unit_integer = 7; break; // weight: 2
              case (strings[n].match(/y/) !== null): var unit_integer = 8; break; // weight: 1
              case (strings[n].match(/z/) !== null): var unit_integer = 9; break; // weight: 1
            }
    
            var coefficient = 10;
            break;
        }
        =end
  
        integer += unit_integer * coefficient;
      end
    
      parameters[i] = integer;
    end
    
    user_parameters
  end
end
