require 'pry'

class Player
  def initialize(**params)
    
  end

  def select_num
    while true
      print "番号を選択して下さい > "
      select_num = gets.to_i
      break if(1..9).include?(select_num)
      puts "1~9の番号で選択して下さい。"
    end
    tables = tables.flatten
    tables[select_num - 1] = "○"
    tables = [tables[0..2],tables[3..5],tables[6..8]]
    tables.each do |table|
      puts "|#{table[0]}" + "|" + "#{table[1]}" + "|" + "#{table[2]}" + "|"
    end
    tables
  end
end

class User < Player

end

class Com < Player

end

class Judge
  # 初期値
  def initialize(**params)
    @user_select = params[:user_select]
    @com_select = params[:com_select]
  end
  # １回ごとの判定
  def checked_column
    chosen_num = chosen_num.flatten
    # 横のパターン　３通り
    # 1-2-3
    case chosen_num
      when[0, 1, 2] == ["○", "○", "○"]
      return true
    # 4-5-6
      when[3, 4, 5] == ["○", "○", "○"]
      return true
    # 7-8-9
      when[6, 7, 8] == ["○", "○", "○"]
      return true
    # 縦のパターン　３通り
    # 1-4-7
      when[0, 3, 6] == ["○", "○", "○"]
      return true
    # 2-5-8
      when[1, 4, 7] == ["○", "○", "○"]
      return true
    # 3-6-9
      when[2, 5, 8] == ["○", "○", "○"]
      return true
    # 斜めのパターン　２通り
    # 1-5-9
      when[0, 4, 8] == ["○", "○", "○"]
      return true
    # 3-5-7
      when[2, 4, 6] == ["○", "○", "○"]
      return true
    else
      return false
    end
  end

  # 繰り返し判定
  def judge_repeat(chosen_num, checked)
    while checked == false

    end
      puts "終了です！"
  end

  # 成立判定
  def judgment
  end
  # 最終結果
  private
  def result
  end
end
end

puts <<~TEXT

               ＜マルバツゲーム＞

              ======ルール======
  ・1~9の数字を選択すると該当する数字の場所に○を置く

  ・縦・横・斜めの１列が揃うと終了

  TEXT

tables = [
  ["1", "2", "3"],
  ["4", "5", "6"],
  ["7", "8", "9"]
]

# テーブルを表示
def disp_table(tables)
  tables.each do |table|
    puts "|#{table[0]}" + "|" + "#{table[1]}" + "|" + "#{table[2]}" + "|"
  end
end
