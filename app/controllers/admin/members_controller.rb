class Admin::MembersController < Admin::Base
  # 会員一覧
  def index
    @members = Member.order("id")
      # .page(params[:page]).per(15)
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @member = Member.new
  end

  # 会員の編集
  def edit
    @member = Member.find(params[:id])
  end

  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to [:admin, @member], notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to [:admin, @member], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  # 会員の削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "会員を削除しました。"
  end
end
