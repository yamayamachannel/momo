class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: [:show, :edit, :update, :destroy ]
  

  # GET /memos
  # GET /memos.json
  def index
    @user = current_user
    @memos = Memo.where(user: current_user)
    if !@user.group_id.nil?                 #もしグループに入っていたら
      @group = Group.find(@user.group_id)   #ユーザーのグループidを見つけてグループを特定
    end
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
    @user = current_user
    @memos = Memo.where(user: @user)
    @others =Memo.where(user: @user).where.not(id: params[:id]) 
  end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(memo_params)
    @memo.user = current_user

    respond_to do |format|
      if @memo.save
        format.html { redirect_to memos_url, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: memos_url }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to memos_url, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: memos_url }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tasuhiku
    @memo = Memo.find(params[:id])
    t=params["money"]
    if params[:button1]
      if t<"0"
        @memo.errors
      elsif  
        @memo.bank += t.to_i
        @memo.save
        Log.create(money:t.to_i, comment:params["comment"], memo_id:@memo.id, sum:@memo.bank)
      end
    elsif params[:button2]
      if t<"0"
        @memo.errors
      elsif  
        @memo.bank -= t.to_i
        @memo.save
        Log.create(minus:t.to_i, comment:params["comment"], memo_id:@memo.id, sum:@memo.bank)
      end
    end
    redirect_to :action => 'show'
  end

  def remittance
    @memo = Memo.find(params[:id])
    @saki = Memo.find(params[:saki])
    t=params["money"]
    if t<"0"
      @memo.errors
    elsif  
      @memo.bank -= t.to_i
      @memo.save
      Log.create(minus:t.to_i, comment:params["comment"], memo_id:@memo.id, sum:@memo.bank)
      @saki.bank += t.to_i
      @saki.save
      Log.create(money:t.to_i, comment: @memo.title+"から送金されました", memo_id:@saki.id, sum:@saki.bank)
    end
    redirect_to :action => 'show'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = Memo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_params
      params.require(:memo).permit(:title, :bank)
    end  
end