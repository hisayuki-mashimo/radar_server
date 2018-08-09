# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name => 'Star Wars' }, { name => 'Lord of the Rings' }])
#   Character.create(name => 'Luke', movie => movies.first)
MasterParameterType.create([
    { :label => '性格傾向' },
    { :label => '運勢' },
    { :label => '教科' },
    { :label => '適正能力' },
    { :label => '耐性能力' }
])


MasterParameter.create([
    { :type_id => 1, :label => '行動力' },
    { :type_id => 1, :label => '適応力' },
    { :type_id => 1, :label => '独創性' },
    { :type_id => 1, :label => '情熱性' },
    { :type_id => 1, :label => '自然愛' },
    { :type_id => 1, :label => 'オーラ' },
    { :type_id => 2, :label => '天運' },
    { :type_id => 2, :label => '健康運' },
    { :type_id => 2, :label => '金運' },
    { :type_id => 2, :label => '勝負運' },
    { :type_id => 3, :label => '国語' },
    { :type_id => 3, :label => '数学' },
    { :type_id => 3, :label => '理科' },
    { :type_id => 3, :label => '社会' },
    { :type_id => 3, :label => '体育' },
    { :type_id => 3, :label => '音楽' },
    { :type_id => 3, :label => '美術' },
    { :type_id => 3, :label => '外語' },
    { :type_id => 4, :label => '体力' },
    { :type_id => 4, :label => '攻撃' },
    { :type_id => 4, :label => '防御' },
    { :type_id => 4, :label => '知力' },
    { :type_id => 4, :label => '魔力' },
    { :type_id => 4, :label => '指揮' },
    { :type_id => 4, :label => '話術' },
    { :type_id => 4, :label => '操縦' },
    { :type_id => 4, :label => '変装' },
    { :type_id => 4, :label => '料理' },
    { :type_id => 4, :label => '品位' },
    { :type_id => 4, :label => '理力' },
    { :type_id => 4, :label => '感性' },
    { :type_id => 4, :label => '人徳' },
    { :type_id => 4, :label => '技術' },
    { :type_id => 4, :label => '包容' },
    { :type_id => 4, :label => '直感' },
    { :type_id => 4, :label => '視力' },
    { :type_id => 4, :label => '霊感' },
    { :type_id => 4, :label => '芸術' },
    { :type_id => 5, :label => '耐暑' },
    { :type_id => 5, :label => '耐寒' },
    { :type_id => 5, :label => '耐魔' },
    { :type_id => 5, :label => '耐獣' },
    { :type_id => 5, :label => '耐風' },
    { :type_id => 5, :label => '耐水' },
    { :type_id => 5, :label => '耐火' },
    { :type_id => 5, :label => '耐Ｇ' },
    { :type_id => 5, :label => '耐菌' },
    { :type_id => 5, :label => '耐毒' },
    { :type_id => 5, :label => '耐光' },
    { :type_id => 5, :label => '耐闇' },
])

users = User.create([
    { :first_name => '水沢', :last_name => '一郎' },
    { :first_name => '金子', :last_name => '二郎' },
    { :first_name => '地位', :last_name => '三郎' },
    { :first_name => '火田', :last_name => '四郎' },
    { :first_name => '木曽', :last_name => '五郎' },
    { :first_name => '土井', :last_name => '六郎' },
    { :first_name => '天城', :last_name => '七郎' },
    { :first_name => '海野', :last_name => '八郎' },
])

UserParameter.create([
    { :user_id => 1, :parameter_id => 1, :parameter => 15 },
    { :user_id => 1, :parameter_id => 2, :parameter => 37 },
    { :user_id => 1, :parameter_id => 3, :parameter => 68 },
    { :user_id => 1, :parameter_id => 4, :parameter => 46 },
    { :user_id => 1, :parameter_id => 5, :parameter => 30 },
    { :user_id => 1, :parameter_id => 6, :parameter => 22 },

    { :user_id => 2, :parameter_id => 1, :parameter => 65 },
    { :user_id => 2, :parameter_id => 2, :parameter => 58 },
    { :user_id => 2, :parameter_id => 3, :parameter => 41 },
    { :user_id => 2, :parameter_id => 4, :parameter => 39 },
    { :user_id => 2, :parameter_id => 5, :parameter => 83 },
    { :user_id => 2, :parameter_id => 6, :parameter => 27 },
])
