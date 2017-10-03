class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    # user registration page
    @user = User.new
  end

  def create
    merge_params
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    #   profile page
  end

  def edit
    #   profile edit
  end

  def update
    merge_params

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])

    unless @user
      return redirect_back_or_to root_path, notice: 'could not find user'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation,
      :about,
      :hair_type,
      :skin_type,
      :makeup,
      :niche,
      :category,
      :routine,
      # products_attributes: [:id, :product_id],
      # products: [:product_id],
      # products_users: [ :product_id, :id, :title ],
    )
  end

  # This is just a hack to be able to multi-select survey attributes.
  def merge_params
    if params['user']['hair_type']
      params['user']['hair_type'].delete('')
      params['user']['hair_type'] = params['user']['hair_type'].join(', ')
    end

    if params['user']['skin_type']
      params['user']['skin_type'].delete('')
      params['user']['skin_type'] = params['user']['skin_type'].join(', ')
    end

    if params['user']['makeup']
      params['user']['makeup'].delete('')
      params['user']['makeup'] = params['user']['makeup'].join(', ')
    end

    if params['user']['niche']
      params['user']['niche'].delete('')
      params['user']['niche'] = params['user']['niche'].join(', ')
    end

    if params['user']['category']
      params['user']['category'].delete('')
      params['user']['category'] = params['user']['category'].join(', ')
    end

    params['user']['password'] = 'password'
    params['user']['password_confirmation'] = 'password'
    # if params['user']['routine']
    #   params['user']['routine'].delete('')
    #   params['user']['routine'] = params['user']['routine'].join(', ')
    # end
  end
end
