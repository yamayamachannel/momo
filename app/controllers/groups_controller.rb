class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update ]
  before_action :authenticate_user!


  def new
    @group = Group.new
  end

  def show
    @user = current_user
    @group = Group.find(@user.group_id)
    @users = User.where(group_id: @group.id)
  end

  def create
    @group = Group.new(group_params)
    @user = current_user

    respond_to do |format|
      if @group.save
        @user.group_id = @group.id
        @user.save
        format.html { redirect_to memos_path, notice: 'グループが作成されました' }
        #format.json { render :show, status: :created, location: groups_url }
      else
        format.html { render :new }
        #format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, :aiko)
  end

end
