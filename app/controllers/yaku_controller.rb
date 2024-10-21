class YakuController < ApplicationController
  def index
    @yaku_values = {
      "リーチ" => { han: 1, fu: 40 },
      "ツモ" => { han: 1, fu: 20 },
      "平和" => { han: 1, fu: nil },
      "一発" => { han: 1, fu: 6 },
      "七対子" => { han: 1, fu: 25 },
      "三色同順" => { han: 2, fu: 0 },
      "一気通貫" => { han: 2, fu: 0 },
      "混一色" => { han: 3, fu: 0 },
      "清一色" => { han: 6, fu: 0 },
      "全帯幺" => { han: 2, fu: 0 },
      "純全帯幺" => { han: 3, fu: 0 }
      # 他の役も追加できます
    }

    # 翻、符、得点を一緒に定義する
    @yaku_score = {
      "han:2,fu:80" => { parent: { tsumo: 1000, ron: 1500 }, child: { tsumo: 100, ron: 500 } },
      "han:1,fu:80" => { parent: 3900, child: 2000 }
    }
  end
end
