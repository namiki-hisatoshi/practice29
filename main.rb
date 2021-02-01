
class Player
  # 初期値
  attr_accessor :user_select, :com_select
  def initialize(**params)
    @user_select = params[:user_select]
    @com_select = params[:com_select]
  end
end

class User < Player

end

class Com < Player

end

class Judge
  # １回ごとの判定
  def checked_column
    chosen_num = chosen_num.flatten
    case chosen_num
      # 横のパターン　3通り✖️6パターン
      # 1-2-3
      when[0, 1, 2] == ["○", "○", "○"]
        return true
      when[0, 2, 1] == ["○", "○", "○"]
        return true
      when[2, 1, 0] == ["○", "○", "○"]
        return true
      when[2, 0, 1] == ["○", "○", "○"]
        return true
      when[1, 2, 0] == ["○", "○", "○"]
        return true
      when[1, 0, 2] == ["○", "○", "○"]
        return true
    # 4-5-6
      when[3, 4, 5] == ["○", "○", "○"]
        return true
      when[3, 5, 4] == ["○", "○", "○"]
        return true
      when[4, 3, 5] == ["○", "○", "○"]
        return true
      when[4, 5, 3] == ["○", "○", "○"]
        return true
      when[5, 3, 4] == ["○", "○", "○"]
        return true
      when[5, 4, 3] == ["○", "○", "○"]
        return true
    # 7-8-9
      when[6, 7, 8] == ["○", "○", "○"]
        return true
      when[6, 8, 7] == ["○", "○", "○"]
        return true
      when[7, 6, 8] == ["○", "○", "○"]
        return true
      when[7, 8, 6] == ["○", "○", "○"]
        return true
      when[8, 6, 7] == ["○", "○", "○"]
        return true
      when[8, 7, 6] == ["○", "○", "○"]
        return true
    # 縦のパターン　３通り✖️6パターン
    # 1-4-7
      when[0, 3, 6] == ["○", "○", "○"]
        return true
      when[0, 6, 3] == ["○", "○", "○"]
        return true
      when[6, 0, 3] == ["○", "○", "○"]
        return true
      when[6, 3, 0] == ["○", "○", "○"]
        return true
      when[3, 6, 0] == ["○", "○", "○"]
        return true
      when[3, 0, 6] == ["○", "○", "○"]
        return true
    # 2-5-8
      when[1, 4, 7] == ["○", "○", "○"]
        return true
      when[1, 7, 4] == ["○", "○", "○"]
        return true
      when[4, 7, 1] == ["○", "○", "○"]
        return true
      when[4, 1, 7] == ["○", "○", "○"]
        return true
      when[7, 1, 4] == ["○", "○", "○"]
        return true
      when[7, 4, 1] == ["○", "○", "○"]
        return true
    # 3-6-9
      when[2, 5, 8] == ["○", "○", "○"]
        return true
      when[2, 8, 5] == ["○", "○", "○"]
        return true
      when[5, 2, 8] == ["○", "○", "○"]
        return true
      when[5, 8, 2] == ["○", "○", "○"]
        return true
      when[8, 5, 2] == ["○", "○", "○"]
        return true
      when[8, 2, 5] == ["○", "○", "○"]
        return true
    # 斜めのパターン　２通り✖️6パターン
    # 1-5-9
      when[0, 4, 8] == ["○", "○", "○"]
        return true
      when[0, 8, 4] == ["○", "○", "○"]
        return true
      when[4, 0, 8] == ["○", "○", "○"]
        return true
      when[4, 8, 0] == ["○", "○", "○"]
        return true
      when[8, 0, 4] == ["○", "○", "○"]
        return true
      when[8, 4, 0] == ["○", "○", "○"]
        return true
    # 3-5-7
      when[2, 4, 6] == ["○", "○", "○"]
        return true
      when[2, 6, 4] == ["○", "○", "○"]
        return true
      when[4, 6, 2] == ["○", "○", "○"]
        return true
      when[4, 2, 6] == ["○", "○", "○"]
        return true
      when[6, 4, 2] == ["○", "○", "○"]
        return true
      when[6, 2, 4] == ["○", "○", "○"]
        return true
    else
      return false
    end
  end

  # 繰り返し判定
  def judge_repeat
    while checked_column == false
      gamemaker.choose_num
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

class GameMaker
  def disp_table
    puts <<~TEXT

                   ＜マルバツゲーム＞

                  ======ルール======
      ・1~9の数字を選択すると該当する数字の場所に○を置く

      ・縦・横・斜めの１列が揃うと終了

      TEXT

    # テーブルを表示
    tables = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]

    tables.each do |table|
      puts "|#{table[0]}" + "|" + "#{table[1]}" + "|" + "#{table[2]}" + "|"
    end
  end
  # 番号を選択
  def chosen_num
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

gamemaker = GameMaker.new
judge = Judge.new


gamemaker.disp_table
gamemaker.chosen_num
judge.checked_column
