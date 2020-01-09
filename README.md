# README
# 概要  
最初に最初から作成した自作アプリケーション「synchroniCITY」。日中の地理関係と気候をキーとした、  
各国都市の類似要素検索アプリである。（＊）  

＊本アプリ作成当初、アプリ名称のスペルを間違って、"syncronicity"としてしまった。  
これをそのまま使用している。正確なスペルは"synchronicity"である。  

# コンセプト  
多様な文化・環境背景や、価値観の異なる人たちと交流する際に、人はとかく自身との違いに目を向けがちであるが、  
そうではなく、似た部分に注目し（平易に言えば、○○繋がり）、共感しようというコンセプトの下で制作した。  
私の妻が中国人であり、また、自分自身北京で５年あまり就業、生活していた体験から、まずは日中をテーマにした  
アプリを開発することにした。  

# DB設計  
## jpcitiesテーブル  
|Column|Type|Options|
|------|----|-------|
|pref|string|null: false|
|jpkanji|string|null: false|
|simplified|string|null: false|
|hira|string|null: false|
|alphabet|string|null: false|
|pinyin|string|
|latitude|float|
|longitude|float|
|kind|string| 

＊simplified  中国の簡体字  
＊latitude  緯度  
＊longitude  経度  
＊kind  都市の種別（市、町、村）  

### Association  
- has_one :jpcity2
- has_one :jpclimate

## jpcity2sテーブル  
|Column|Type|Options|
|------|----|-------|
|lati|float|null: false|
|longi|float|null: false|
|pref|string|
|income|integer|
|r_price|float|
|popul|float|
|size|float|
|dense|float|
|jpcity_id|integer|
|latitude_id|integer|
|jpkanji|string|

＊r_price  不動産価格。日本の都市については、  
各都市の住宅地標準地の公示地価平均（平米単価）を入力予定。  

### Association
- belongs_to :jpcity
- belongs_to :latitude
- has_many :chcity2s, through: :latitude

## jpclimatesテーブル
|Column|Type|Options|
|------|----|-------|
|jpcity_id|integer null: false|
|temp_ave|float|
|rain_total|float|
|warmin|integer|
|cldiv_id|integer|
|max_temp|float|
|max_temp_month|integer|
|min_temp|float|
|min_temp_month|integer|
|jpkanji|string|
|snow_total|integer|
|middle_temp|float|

### Association
- belongs_to :jpcity

＊cldiv_id　気候区分（未着手）  
＊middle_temp　平均気温（temp_ave)のデータが無い場合が多いため、  
平均最高気温の最も高い月のデータと、同最低気温の最も低い月のデータを  
平均した値を入力するカラムを作成した。  

## chcitiesテーブル
|Column|Type|Options|
|------|----|-------|
|hira|string|null: false|
|simplified|string|null: false|
|pinyin|string|null: false|
|latitude|float|
|longitude|float|
|kind|string| 
|province_id|integer|foreign_ket: true|

＊province_id 中国の省のid(４つの直轄市については、市名が入っている）  

### Association
- has_one :chcity2
- has_one :chclimates
- belongs_to :province 

## chcity2sテーブル
|Column|Type|Options|
|------|----|-------|
|lati|float|null: false|
|longi|float|null: false|
|prov|string|
|income|integer|
|r_price|float|
|popul|float|
|size|float|
|dense|float|
|chcity_id|integer|
|latitude_id|integer|
|jpkanji|string|

＊r_price  中国の都市のこのカラムについては、マンションの平米単価。  

### Association
- belongs_to :chcity
- belongs_to :latitude
- has_many :jpcity2s, through: :latitude

## chclimatesテーブル
|Column|Type|Options|
|------|----|-------|
|chcity_id|integer null: false|
|temp_ave|float|
|rain_total|float|
|warmin|integer|
|cldiv_id|integer|
|max_temp|float|
|max_temp_month|integer|
|min_temp|float|
|min_temp_month|integer|
|jpkanji|string|
|snow_total|integer|
|middle_temp|float|

### Association
- belongs_to :chcity

## latitudesテーブル
|Column|Type|Options|
|------|----|-------|
|lat_min|float|
|lat_max|float|

＊jpcitiesと chcities の、latitude_id を介した中間テーブルであるが、  
機能していない。テーブルのレコードは、コントローラの違いに関わらず取得できるということを理解しておらず、  
jpcitiesのレコードからchcitiesのレコードを取得するには（あるいはその逆）、  
必ず多対多の結びつきを表した中間テーブルが必要だと考えていた。しかしながら中間テーブルは、  
インスタグラムやツイッターのタグのように、あるクラスの要素を別のクラスでくくるような場合に必要なもので、  
現在の本アプリの機能上は、必要ではない。  

### Association
- has_many :chcity2s
- has_many :jpcity2s


## Prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string |null: false|
|simplified|string|

### Association
 
## Provincesテーブル
|Column|Type|Options|
|------|----|-------|
|jpkanji|string|null: false|
|simplified|string|null: false|
|pinyin|string|null: false|

### Association
- has_many :chcities

## cldivsテーブル
|Column|Type|Options|
|------|----|-------|

### Association

＊気候区分（climate division)テーブル（未着手）

## Urban_areasテーブル
|Column|Type|Options|
|------|----|-------|

### Association

＊都市圏テーブル（未着手）。都市の規模を単純な行政区域と域内の人口で測ることはできないため、  
このデータを見せることは必須であろうと思う。直感的にも、東京２３区と北京の人口、面積を単純比較することは　　  
かなり違和感がある（前者が約６１９㎢、約９６５万人、後者が16,400㎢、約２,１７０万人)。北京市の行政面積は  
広大だが、山がちかつ人口はまばらで、温泉の湧き出るリゾート地まで含まれている（東京23区に富士山麓や  
秩父連山まで含まれる感じ）。都市の規模は、一定の人口密度が連続し、同一の通勤圏内である地域(山間部、  
農村部を含まない、都市部）を一体として把握するべきである。こうした考えに基づいたデータが、米国の公共政策  
のアナリストであり、学者のWendell Coxがウェブ上で公開している、「Demographia World Urban Areas」  
である。これによると世界最大の都市圏は、東京ー横浜都市圏であり、推計人口は約3,850万人、面積は8,200㎢  
に及ぶ(以下のように定義されている:Tokyo, Kanagawa, Chiba and Saitama prefectures and  
smaller areas of Gunma, Tochigi and Ibaraki prefectures.)。　　
一方で北京都市圏は、同1,943万人、約4,100㎢となっている（その定義は確認できなかったが,  
蜜雲（Miyun)や怀柔（Huailong)といった山間部は含まれていないと思う。逆に北京に隣接して  
通勤圏内の一部の河北省の都市は含まれていると思われる）。  

# 機能
## 概要
ルートに設定されているjpcities/search ページでは、上段の検索フォームに日本の都市名を入力すると、
類似する緯度の中国の都市情報が表示されるようになっている。下段の検索フォームに同様に入力すると、
類似する気候の中国都市情報が表示される。
中国側から日本の都市を検索することもできる。chcities/search ページにも同様の検索フォームがある。
それぞれのページへは、「Change country」ボタンをクリックすることで遷移できる。

## 都市名のインクリメンタルサーチ
４つの検索フォーム全てにJSを利用して実装した。フォームはform_tagを使用。
### 工夫した点
日本の都市名については、平仮名、漢字、アルファベット三種で検索できるようにした。
中国の都市名は、簡体字、ピンインで検索可能。
### 苦労した点、問題点
当初は４つの検索について、htmlの要素名が重複していた。これではうまく機能しないため
全ての場合で異なる要素名を付け直した。
また、現状では検索フォームの表示が確定したあとで、それをカーソルで消すと、
表示される候補が残ってしまう不具合がある。今後修正を図る。

## 地図表示
百度地図を利用。google map を使用しなかったのは、中国ではそれが利用できないからである(本appは
百度地図を利用。google map を使用しなかったのは、中国ではそれが利用できないからである(
百度はAPIを公開しており（学習・研究用には無料）、それを利用した（但し、個人情報（中国携帯番号と中国身分証番号）の
提供が必要で、外国人の利用は難しい）。


















