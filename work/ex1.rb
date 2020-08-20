# Ruby課題１
# 標準入力で幾つかの単語を入力する。単語の入力は改行区切りとする。
# 入力された単語のうち、5文字未満の単語のみを取り出し、配列として返すスクリプトを書け。
# なお、入力の終了は空の単語が入力された時とする。

res = []

# gets: 標準入力の取得
# chomp: 改行文字の削除
while line = gets
  if line.chomp.size == 0 # 終了
    break
  elsif line.chomp.size < 5
    res.push(line.chomp)
  end
end

print res
