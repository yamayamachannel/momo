class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update ]
  before_action :authenticate_user!


  def new
    @group = Group.new
  end

  def sanka
    
  end

  def show
    @user = current_user
    @group = Group.find(@user.group_id)
    @users = User.where(group_id: @group.id)
    @others = User.where(group_id: @group.id).where.not(id: @user.id)
  end

  def taikai
    @user = current_user
    @user.update(group_id: nil)
    respond_to do |format|
     format.html { redirect_to memos_path, notice: '***グループを退会しました***' }
    end 

  end

  def sanka2
    @user = current_user
    @group = Group.find_by(name: params[:name])

    if @group.nil?
      respond_to do |format|
        format.html { redirect_to groups_new_path, notice: '***グループが存在しません***' }
     end 
      # redirect_to action: :sanka
    else
      if (@group.aiko == params[:aiko]) # 合言葉が一致した時
        @user.update(group_id: @group.id)
        respond_to do |format|
          #  redirect_to controller: :memos, action: :index 
           format.html { redirect_to memos_path, notice: '***グループに参加しました***' }
        end   
      else                               # 合言葉が一致しなかった時
        # redirect_to action: :sanka
        respond_to do |format|
           format.html { redirect_to groups_new_path, notice: '***あいことばが一致しません***' }
        end 
      end
    end   
  end

  def create
    @group = Group.new(group_params)
    @user = current_user

    respond_to do |format|
      if @group.save
        @user.group_id = @group.id
        @user.save
        format.html { redirect_to memos_path, notice: '***グループが作成されました***' }
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

  def remittance_out
    @user = current_user
    @memo = Memo.find(params[:mae_out])
    @saki = Memo.find(params[:saki_out])
    t=params["money"]
    if t<"0"
      @memo.errors
    elsif  
      @memo.bank -= t.to_i
      @memo.save
      Log.create(minus:t.to_i, comment:params["comment"], memo_id:@memo.id, sum:@memo.bank)
      @saki.bank += t.to_i
      @saki.save
      Log.create(money:t.to_i, comment: @user.username+"さんの"+@memo.title+"から送金されました", memo_id:@saki.id, sum:@saki.bank)
    end
    redirect_to :action => 'show'
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
