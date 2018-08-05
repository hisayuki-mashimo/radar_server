class AdminController < ApplicationController
    def user_list
        @limit = 4
        @page = params[:page] ? params[:page].to_i : 1
        offset = @limit * (@page - 1)

        @users = User.limit(@limit).offset(offset)
        #p 'AAAAAAAAAA'
        #p @users
        #p 'BBBBBBBBBB'
    end
end
