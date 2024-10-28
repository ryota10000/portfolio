class YakuController < ApplicationController
  def index
    @yaku_values = {
      "立直" => { han: 1, fu: 0 },
      "一発" => { han: 1, fu: 0 },
      "門前清自模和" => { han: 1, fu: 0 },
      "平和" => { han: 1, fu: nil },
      "断么九" => { han: 1, fu: 0 },
      "一盃口" => { han: 1, fu: 0 },
      "白" => { han: 1, fu: 0 },
      "發" => { han: 1, fu: 0 },
      "中" => { han: 1, fu: 0 },
      "自風牌" => { han: 1, fu: 0 },
      "場風牌" => { han: 1, fu: 0 },
      "槍槓" => { han: 1, fu: 0 },
      "嶺上開花" => { han: 1, fu: 0 },
      "海底撈月" => { han: 1, fu: 0 },
      "河底撈魚" => { han: 1, fu: 0 },

      "ダブル立直" => { han: 2, fu: 0 },
      "七対子" => { han: 2, fu: 0 },
      "三色同順" => { han: 2, fu: 0 },
      "一気通貫" => { han: 2, fu: 0 },
      "混全帯幺九" => { han: 2, fu: 0 },
      "対々和" => { han: 2, fu: 0 },
      "三暗刻" => { han: 2, fu: 0 },
      "三色同刻" => { han: 2, fu: 0 },
      "混老頭" => { han: 2, fu: 0 },
      "小三元" => { han: 2, fu: 0 },
      "三槓子" => { han: 2, fu: 0 },

      "混一色" => { han: 3, fu: 0 },
      "純全帯幺九" => { han: 3, fu: 0 },
      "二盃口" => { han: 3, fu: 0 },

      "清一色" => { han: 6, fu: 0 }
    }

    @yaku_details = {
      "順子" => { han: 0, fu: 0 },
      "一九字牌のポン" => { han: 0, fu: 2 },
      "一九字牌のアンコ" => { han: 0, fu: 8 },
      "一九字牌のミンカン" => { han: 0, fu: 16 },
      "一九字牌のアンカン" => { han: 0, fu: 32 },
      "二〜八のポン" => { han: 0, fu: 2 },
      "二〜八のアンコ" => { han: 0, fu: 4 },
      "二〜八のミンカン" => { han: 0, fu: 8 },
      "二〜八のアンカン" => { han: 0, fu: 16 },

      "一〜九 / 客風牌" => { han: 0, fu: 0 },
      "自風牌 / 場風牌 / 三元牌" => { han: 0, fu: 2 },
      "連風牌(ない場合あり)" => { han: 0, fu: 4 },

      "リャンメン / シャンポン" => { han: 0, fu: 0 },
      "カンチャン / ペンチャン / タンキ / ノベタン " => { han: 0, fu: 2 }
    }


    # 翻、符、得点を一緒に定義する
    @yaku_score = {
      "han:1,fu:20" => { parent: { ron: 1500, tumo: "800オール" }, child: { ron: 1000, tumo: "500/700" } },
      "han:1,fu:30" => { parent: { ron: 1500, tumo: "800オール" }, child: { ron: 1000, tumo: "500/700" } },
      "han:1,fu:40" => { parent: { ron: 2000, tumo: "1100オール" }, child: { ron: 1300, tumo: "600/900" } },
      "han:1,fu:50" => { parent: { ron: 2400, tumo: "1200オール" }, child: { ron: 1600, tumo: "600/1000" } },
      "han:1,fu:60" => { parent: { ron: 2900, tumo: "1500オール" }, child: { ron: 2000, tumo: "800/1300" } },
      "han:1,fu:70" => { parent: { ron: 3400, tumo: "1800オール" }, child: { ron: 2300, tumo: "900/1500" } },
      "han:1,fu:80" => { parent: { ron: 3900, tumo: "2000オール" }, child: { ron: 2600, tumo: "1100/1700" } },
      "han:1,fu:90" => { parent: { ron: 4400, tumo: "2300オール" }, child: { ron: 2900, tumo: "1200/1900" } },
      "han:1,fu:100" => { parent: { ron: 4800, tumo: "2400オール" }, child: { ron: 3200, tumo: "1200/2000" } },

      "han:2,fu:20" => { parent: { ron: 2900, tumo: "1100オール" }, child: { ron: 2000, tumo: "600/900" } },
      "han:2,fu:25" => { parent: { ron: 2400, tumo: "N/A" }, child: { ron: 1600, tumo: "N/A" } },
      "han:2,fu:30" => { parent: { ron: 2900, tumo: "1500オール" }, child: { ron: 2000, tumo: "800/1300" } },
      "han:2,fu:40" => { parent: { ron: 3900, tumo: "2000オール" }, child: { ron: 2600, tumo: "1100/1700" } },
      "han:2,fu:50" => { parent: { ron: 4800, tumo: "2400オール" }, child: { ron: 3200, tumo: "1200/2000" } },
      "han:2,fu:60" => { parent: { ron: 5800, tumo: "3000オール" }, child: { ron: 3900, tumo: "1500/2500" } },
      "han:2,fu:70" => { parent: { ron: 6800, tumo: "3500オール" }, child: { ron: 4500, tumo: "1800/2900" } },
      "han:2,fu:80" => { parent: { ron: 7700, tumo: "3900オール" }, child: { ron: 5200, tumo: "2000/3300" } },
      "han:2,fu:90" => { parent: { ron: 8700, tumo: "4400オール" }, child: { ron: 5800, tumo: "2300/3700" } },
      "han:2,fu:100" => { parent: { ron: 9600, tumo: "4800オール" }, child: { ron: 6400, tumo: "2400/4000" } },
      "han:2,fu:110" => { parent: { ron: 10600, tumo: "5400オール" }, child: { ron: 7100, tumo: "2700/4500" } },

      "han:3,fu:20" => { parent: { ron: 3900, tumo: "2000オール" }, child: { ron: 2600, tumo: "1100/1700" } },
      "han:3,fu:25" => { parent: { ron: 4800, tumo: "2400オール" }, child: { ron: 3200, tumo: "1200/2000" } },
      "han:3,fu:30" => { parent: { ron: 5800, tumo: "3000オール" }, child: { ron: 3900, tumo: "1500/2500" } },
      "han:3,fu:40" => { parent: { ron: 7700, tumo: "3900オール" }, child: { ron: 5200, tumo: "2000/3300" } },
      "han:3,fu:50" => { parent: { ron: 9600, tumo: "4800オール" }, child: { ron: 6400, tumo: "2400/4000" } },
      "han:3,fu:over60" => { parent: { ron: 12000, tumo: "6000オール" }, child: { ron: 8000, tumo: "3000/5000" } },

      "han:4,fu:20" => { parent: { ron: 7700, tumo: "3900オール" }, child: { ron: 5200, tumo: "2000/3300" } },
      "han:4,fu:25" => { parent: { ron: 9600, tumo: "4800オール" }, child: { ron: 6400, tumo: "2400/4000" } },
      "han:4,fu:over30" => { parent: { ron: 12000, tumo: "6000オール" }, child: { ron: 8000, tumo: "3000/5000" } },

      "han:5,fu:any" => { parent: { ron: 12000, tumo: "6000オール" }, child: { ron: 8000, tumo: "3000/5000" } },
      "han:6,fu:any" => { parent: { ron: 18000, tumo: "9000オール" }, child: { ron: 12000, tumo: "4500/7500" } },
      "han:7,fu:any" => { parent: { ron: 18000, tumo: "9000オール" }, child: { ron: 12000, tumo: "4500/7500" } },
      "han:8,fu:any" => { parent: { ron: 24000, tumo: "12000オール" }, child: { ron: 16000, tumo: "6000/10000" } },
      "han:9,fu:any" => { parent: { ron: 24000, tumo: "12000オール" }, child: { ron: 16000, tumo: "6000/10000" } },
      "han:10,fu:any" => { parent: { ron: 24000, tumo: "12000オール" }, child: { ron: 16000, tumo: "6000/10000" } },
      "han:11,fu:any" => { parent: { ron: 36000, tumo: "18000オール" }, child: { ron: 24000, tumo: "9000/15000" } },
      "han:12,fu:any" => { parent: { ron: 36000, tumo: "18000オール" }, child: { ron: 24000, tumo: "9000/15000" } },
      "han:over13,fu:any" => { parent: { ron: 48000, tumo: "24000オール" }, child: { ron: 32000, tumo: "12000/20000" } }
    }
  end
end
