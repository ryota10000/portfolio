class YakuController < ApplicationController
  def index
    @yaku_values = {
      'リーチ' => { han: 1, fu: 0 },
      'ツモ' => { han: 1, fu: 20 },
      '平和' => { han: 1, fu: 2 },
      '一発' => { han: 1, fu: 6 },
      # 他の役も追加できます
    }

    # 翻、符、得点を一緒に定義する
    @yaku_score = {
      'han:1,fu:0' => 1000,   # 翻1、符0の場合の得点
      'han:1,fu:20' => 2000,  # 翻1、符20の場合の得点
      'han:2,fu:0' => 4000,   # 翻2、符0の場合の得点
      'han:2,fu:20' => 8000,   # 翻2、符20の場合の得点
    }
  end
end
