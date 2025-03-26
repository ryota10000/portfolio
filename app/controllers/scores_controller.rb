class ScoresController < ApplicationController
  before_action :require_login

  def create
    @user = current_user
    @new_scores = scores_params.map { |score_data| @user.scores.build(score_data) unless score_data.values.any?(&:blank?) }.compact

    if @new_scores.all?(&:save)
      redirect_to mypage_path, notice: "スコアを追加しました"
    else
      render 'users/show', status: :unprocessable_entity
    end
  end

  def destroy_group
    if params[:score_ids].present?
      scores = current_user.scores.where(id: params[:score_ids])

      if scores.any?
        scores.destroy_all
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to mypage_path, notice: "スコアを削除しました" }
        end
      else
        redirect_to mypage_path, alert: "削除するスコアが見つかりません"
      end
    else
      redirect_to mypage_path, alert: "削除するスコアが指定されていません"
    end
  end

  private

  def scores_params
    params.require(:scores).require(:scores).values.map do |score|
      score.permit(:name, :score)
    end
  end
end
