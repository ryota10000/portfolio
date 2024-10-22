class YakuController < ApplicationController
  def index
    @yaku_values = {
      "リーチ" => { han: 1, fu: 90 },
      "ツモ" => { han: 1, fu: 0 },
      "平和" => { han: 1, fu: nil },
      "一発" => { han: 1, fu: 0 },
      "七対子" => { han: 2, fu: 0 },
      "三色同順" => { han: 1, fu: 0 },
      "一気通貫" => { han: 1, fu: 0 },
      "混一色" => { han: 2, fu: 0 },
      "清一色" => { han: 5, fu: 0 },
      "全帯幺" => { han: 1, fu: 0 },
      "純全帯幺" => { han: 2, fu: 0 }
      # 他の役も追加できます
    }

    # 翻、符、得点を一緒に定義する
    @yaku_score = {
      "han:1,fu:30" => { parent: { tumo: 1500, ron: "800オール" }, child: { tumo: 1000, ron: "500/700" } },
      "han:1,fu:40" => { parent: { tumo: 2000, ron: "1100オール" }, child: { tumo: 1300, ron: "600/900" } },
      "han:1,fu:50" => { parent: { tumo: 2400, ron: "1200オール" }, child: { tumo: 1600, ron: "600/1000" } },
      "han:1,fu:60" => { parent: { tumo: 2900, ron: "1500オール" }, child: { tumo: 2000, ron: "800/1300" } },
      "han:1,fu:70" => { parent: { tumo: 3400, ron: "1800オール" }, child: { tumo: 2300, ron: "900/1500" } },
      "han:1,fu:80" => { parent: { tumo: 3900, ron: "2000オール" }, child: { tumo: 2600, ron: "1100/1700" } },
      "han:1,fu:90" => { parent: { tumo: 4400, ron: "2300オール" }, child: { tumo: 2900, ron: "1200/1900" } },
      "han:1,fu:100" => { parent: { tumo: 4800, ron: "2400オール" }, child: { tumo: 3200, ron: "1200/2000" } },

      "han:2,fu:20" => { parent: { tumo: 'N/A', ron: "1100オール" }, child: { tumo: 'N/A', ron: "600/900" } },
      "han:2,fu:25" => { parent: { tumo: 2400, ron: 'N/A' }, child: { tumo: 1600, ron: 'N/A' } },
      "han:2,fu:30" => { parent: { tumo: 2900, ron: "1500オール" }, child: { tumo: 2000, ron: "800/1300" } },
      "han:2,fu:40" => { parent: { tumo: 3900, ron: "2000オール" }, child: { tumo: 2600, ron: "1100/1700" } },
      "han:2,fu:50" => { parent: { tumo: 4800, ron: "2400オール" }, child: { tumo: 3200, ron: "1200/2000" } },
      "han:2,fu:60" => { parent: { tumo: 5800, ron: "3000オール" }, child: { tumo: 3900, ron: "1500/2500" } },
      "han:2,fu:70" => { parent: { tumo: 6800, ron: "3500オール" }, child: { tumo: 4500, ron: "1800/2900" } },
      "han:2,fu:80" => { parent: { tumo: 7700, ron: "3900オール" }, child: { tumo: 5200, ron: "2000/3300" } },
      "han:2,fu:90" => { parent: { tumo: 8700, ron: "4400オール" }, child: { tumo: 5800, ron: "2300/3700" } },
      "han:2,fu:100" => { parent: { tumo: 9600, ron: "4800オール" }, child: { tumo: 6400, ron: "2400/4000" } },
      "han:2,fu:110" => { parent: { tumo: 10600, ron: "5400オール" }, child: { tumo: 7100, ron: "2700/4500" } },

      "han:3,fu:20" => { parent: { tumo: 3900, ron: "2000オール" }, child: { tumo: 2600, ron: "1100/1700" } },
      "han:3,fu:25" => { parent: { tumo: 4800, ron: "2400オール" }, child: { tumo: 3200, ron: "1200/2000" } },
      "han:3,fu:30" => { parent: { tumo: 5800, ron: "3000オール" }, child: { tumo: 3900, ron: "1500/2500" } },
      "han:3,fu:40" => { parent: { tumo: 7700, ron: "3900オール" }, child: { tumo: 5200, ron: "2000/3300" } },
      "han:3,fu:50" => { parent: { tumo: 9600, ron: "4800オール" }, child: { tumo: 6400, ron: "2400/4000" } },
      "han:3,fu:over60" => { parent: { tumo: 12000, ron: "6000オール" }, child: { tumo: 8000, ron: "3000/5000" } },

      "han:4,fu:20" => { parent: { tumo: 7700, ron: "3900オール" }, child: { tumo: 5200, ron: "2000/3300" } },
      "han:4,fu:25" => { parent: { tumo: 9600, ron: "4800オール" }, child: { tumo: 6400, ron: "2400/4000" } },
      "han:4,fu:over30" => { parent: { tumo: 12000, ron: "6000オール" }, child: { tumo: 8000, ron: "3000/5000" } },

      "han:5,fu:any" => { parent: { tumo: 12000, ron: "6000オール" }, child: { tumo: 8000, ron: "3000/5000" } },
      "han:6,fu:any" => { parent: { tumo: 18000, ron: "9000オール" }, child: { tumo: 12000, ron: "4500/7500" } },
      "han:7,fu:any" => { parent: { tumo: 18000, ron: "9000オール" }, child: { tumo: 12000, ron: "4500/7500" } },
      "han:8,fu:any" => { parent: { tumo: 24000, ron: "12000オール" }, child: { tumo: 16000, ron: "6000/10000" } },
      "han:9,fu:any" => { parent: { tumo: 24000, ron: "12000オール" }, child: { tumo: 16000, ron: "6000/10000" } },
      "han:10,fu:any" => { parent: { tumo: 24000, ron: "12000オール" }, child: { tumo: 16000, ron: "6000/10000" } },
      "han:11,fu:any" => { parent: { tumo: 36000, ron: "18000オール" }, child: { tumo: 24000, ron: "9000/15000" } },
      "han:12,fu:any" => { parent: { tumo: 36000, ron: "18000オール" }, child: { tumo: 24000, ron: "9000/15000" } },
      "han:over13,fu:any" => { parent: { tumo: 48000, ron: "24000オール" }, child: { tumo: 32000, ron: "12000/20000" } }
    }
  end
end
