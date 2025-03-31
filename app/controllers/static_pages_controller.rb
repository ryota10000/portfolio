class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [:terms, :privacy, :help]

  def terms # 利用規約
  end

  def privacy # プライバシーポリシー
  end

  def help # 使い方の説明
  end
end