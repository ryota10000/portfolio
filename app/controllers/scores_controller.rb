class ScoresController < ApplicationController
  before_action :require_login

  def create
    @user = current_user
    @new_scores = scores_params.map { |score_data| @user.scores.build(score_data) unless score_data.values.any?(&:blank?) }.compact

    if @new_scores.all?(&:save)
      redirect_to battle_score_path, notice: "スコアを追加しました"
    else
      render 'users/show', status: :unprocessable_entity
    end
  end

  def destroy_group
    @user = current_user

    if params[:score_ids].blank?
      redirect_to battle_score_path, alert: "削除するスコアが指定されていません" and return
    end

    @scores = @user.scores.where(id: params[:score_ids])

    if @scores.destroy_all
      respond_to do |format|
        format.turbo_stream { render :destroy_group, formats: :turbo_stream, locals: { user: @user } } # スコアを渡す必要はもうありません
        format.html { redirect_to battle_score_path, notice: "スコアを削除しました" }
      end
    else
      redirect_to battle_score_path, alert: "削除するスコアが見つかりません"
    end
  end

  private

  def scores_params
    params.require(:scores).require(:scores).values.map do |score|
      score.permit(:name, :score)
    end
  end
end
