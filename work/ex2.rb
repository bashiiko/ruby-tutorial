# Ruby課題2
# 以下のようなコースと教師のリストがあるとする.
#
#  # コースリスト： コース ID => [ コース名, 単位数 ]
#  courses = [ { 'M2001' => [ '数学２-１', 2 ] },
#              { 'M3001' => [ '数学３-1', 4 ] },
#              { 'E1001' => [ '英語１', 2 ] },
#              { 'E1002' => [ '英語２', 2 ] },
#              { 'H3001' => [ '歴史３-１', 3 ] } ]
#
#  # 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
#  teachers = [ { 1 => [ '佐藤', [ 'E1001', 'E1002' ] ] },
#               { 2 => [ '鈴木', [ 'M2001', 'M3001' ] ] } ]
# 上記のリストを初期入力として,どのコースを誰が担当しているかを出力するスクリプトを書け（つまり,スクリプトの冒頭に上記をコピーして書く）. ただし以下の条件を満たすようにすること.
#
# 「コースリスト」の内容や「教師リスト」の内容が異なっていても正しく動作するように作成する.
# コース名と教師名を使って表示する.
# 常にコースごとにまとめて表示されるようにする.
# 教師リストにない場合でも、「担当なし」のように表示すること。

# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [ { 'M2001' => [ '数学２-１', 2 ] },
           { 'M3001' => [ '数学３-1', 4 ] },
           { 'E1001' => [ '英語１', 2 ] },
           { 'E1002' => [ '英語２', 2 ] },
           { 'H3001' => [ '歴史３-１', 3 ] } ]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'E1001', 'E1002' ] ] },
            { 2 => [ '鈴木', [ 'M2001', 'M3001' ] ] } ]
            #{ 2 => [ '鈴木', [ 'M2001', 'M3001', 'E1002' ] ] } ]

# （改）コースリスト : コース名 => 教師名
courses_to_teacher = {}
for t_id in 0..teachers.size-1 do
  t_name = teachers[t_id].values[0][0]    # 教師名
  c_id_list = teachers[t_id].values[0][1] # コース ID
  for c_id in c_id_list
    if courses_to_teacher.has_key?(c_id)  # 同一コースを複数の教師が担当している場合
      courses_to_teacher[c_id] = courses_to_teacher[c_id], t_name
    else
      courses_to_teacher[c_id] = t_name
    end
  end
end

#puts courses_to_teacher

for i in 0..courses.size-1 do
  # Hash.fetch 第一引数：検索対象，第二引数：検索対象が存在しない場合の戻り値
  # courses[i].keys / courses[i].values がArray型で取得されるためkeys[0] / values[0]
  c_name = courses[i].values[0][0]       # コース名
  puts "#{c_name} : #{courses_to_teacher.fetch(courses[i].keys[0], '担当なし')}"
end
