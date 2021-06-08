# frozen_string_literal: true

# Controller for user
class Api::V1::UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
    data = { email: @user.email }

    render json: data, status: :ok
  end

  private

  def load_user
    @user = User.find_by id: user_params[:id]
    return if @user

    render json: {}, status: :not_found
  end

  def user_params
    params.require(:user).permit %i[id]
  end
end
