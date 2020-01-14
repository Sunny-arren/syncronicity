# README
# 概要  
最初に最初から作成した自作アプリケーション「synchroniCITY」。日中の地理関係と気候をキーとした、  
都市相互の類似要素検索アプリである。

＊本アプリ作成当初、アプリ名称のスペルを間違って、"syncronicity"としてしまった。  
これをそのまま使用している。正確なスペルは"synchronicity"である。  

＊中国の都市情報の中に、台北が含まれている。これは、本Appを中国（大陸）でアップロードすることを  
前提としているからで、同国の政策に従ったということである。私自身は台湾の民主主義体制を支持  
している。もちろん、この度の総統選の結果も尊重する。  

# コンセプト  
多様な文化・環境背景や、価値観の異なる人たちと交流する際に、人はとかく自身との違いに目を向けがちであるが、  
そうではなく、似た部分に注目し（平易に言えば、○○繋がり）、共感しようというコンセプトの下で制作した。  
私の妻が中国人であり、また、自分自身北京で5年あまり就業、生活していた体験から、まずは日中をテーマにした  
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

＊cldiv_id 気候区分（未着手）  
＊middle_temp 平均気温（temp_ave)のデータが無い場合が多いため、  
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
|province_id|integer|foreign_key: true|

＊province_id 中国の省のid(４つの直轄市については、その市自身）  

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
このデータを見せることは必須であろうと思う。直感的にも、東京23区と北京の人口、面積を単純比較することは  
かなり違和感がある（前者が約619㎢、約965万人、後者が16,400㎢、約2,170万人)。北京市の行政面積は  
広大だが、山がちかつ人口はまばらで、温泉の湧き出るリゾート地まで含まれている（東京23区に富士山麓や  
秩父連山まで含まれる感じ）。都市の規模は、一定の人口密度が連続し、同一の通勤圏内である地域(山間部や  
農村部を含まない都市部）を一体として把握するべきである。こうした考えに基づいたデータが、米国の公共政策  
のアナリストであり、学者のWendell Coxがウェブ上で公開している、「Demographia World Urban Areas」  
である。これによると世界最大の都市圏は、東京ー横浜都市圏であり、推計人口は約3,850万人、面積は8,200㎢  
に及ぶ(以下のように定義されている:Tokyo, Kanagawa, Chiba and Saitama prefectures and  
smaller areas of Gunma, Tochigi and Ibaraki prefectures.)。  
一方で北京都市圏は、同1,943万人、約4,100㎢となっている（その定義は確認できなかったが,  
蜜雲（Miyun)区や怀柔（Huairon)区といった山間部は含まれていないと思う。逆に北京に隣接して  
通勤圏内の一部の河北省の三河(Sanhe)市は含まれていると思われる）。  

# 機能
## 概要
ルートに設定されているjpcities/search ページでは、上段の検索フォームに日本の都市名を入力すると、
類似する緯度の中国の都市情報が表示されるようになっている。下段の検索フォームに同様に入力すると、
類似する気候の中国都市情報が表示される。
中国側から日本の都市を検索することもできる。chcities/search ページにも同様の検索フォームがある。
それぞれのページへは、「Change country」ボタンをクリックすることで遷移できる（この動きはJSを利用）。  

![日本の都市から中国の都市をサーチする画面](https://user-images.githubusercontent.com/56028886/72042795-c6fa7a80-32f2-11ea-9c84-7d07e16ee521.png)

![中国の都市から日本の都市をサーチする画面](https://user-images.githubusercontent.com/56028886/72042830-e2fe1c00-32f2-11ea-9e7d-f52ef2673c80.png)

## 都市名のインクリメンタルサーチ  
4つの検索フォーム全てにJSを利用して実装した。  
検索候補をクリックすると、入力都市が確定→エンターキーで送信（あるいは右端のサーチアイコンをクリック）。  
### 工夫した点  
日本の都市名については、平仮名、漢字、アルファベット三種で検索できるようにした。  
中国の都市名は、簡体字、ピンインで検索可能。  
### 苦労した点、問題点
当初は4つの検索について、htmlの要素名が重複していた。これではうまく機能しないため  
全ての場合で異なる要素名を付け直した。  
[また、現状では検索フォームの表示が確定したあとで、それをカーソルで消すと、  
表示される候補が残ってしまう不具合がある。今後修正を図る→1月10日解決。ajaxの記述のすぐ前にあった  
if input != ""を削除。これが存在していたことにより、input == nillの時に、ajax以降が動かなく  
なっていたのが原因。したがって入力済の都市名をデリートした時に、以前表示された内容が消えずに残って  
しまっていた）]  
また、レコードに無い都市を送信するとエラー表示になってしまうのを防ぐ対応が必要→1月11日解決。
各コントローラーのsearch_resultアクションに以下のように記述。
 ```
 if Jpcity.find_by(jpkanji: params[:keyword]).nil?
   redirect_to controller: :jpcities, action: :search
 else 
   (以下省略)
 ```
 あるいは
 ```
 if Chcity.find_by(simplified: params[:keyword]).nil?
   redirect_to controller: :chcities, action: :search
 else 
   (以下省略)
```
リダイレクト時のフラッシュメッセージは1月13日に実装完了。

## サーチフォームについて  
form_tagを用いている。また、入力都市確定後にエンターキーのほか、サーチアイコンをクリックしても、  
検索結果が表示できるようになっている。  
### 工夫した点  
当初は検索キーワードと共に取得しているid情報を用いて、showの画面に遷移することを目論んでいたが、うまくできなかった。このため、4種のcontroller にsearch_resultというアクションを作り、そこで表示された内容をshowアクションでrenderさせるという方法でうまく行った。  
### 苦労した点、問題点
サーチアイコンをアクティブにするために、location.hrefで検索結果表示のURL（都市名の手前まで）と、JSのval（）で検索フォームに入力された都市名を付け加えるというアイデアを編み出すには、相当時間がかかった。本機能については、フォームが空の状態でクリックすると、都市名を先に入力するようにアラートを出せるようにしている。

```
$(document).on("click", ".submit_lat", function () {
  str = $(".search-form-lat").val();
  if(str != ""){
  location.href= './jpcities/search_result?utf8=✓&keyword='+str;
  }else{
  alert('都市名を先に入力お願いします！')
  }
})
```

## 地図表示・緯度経度情報取得について  
地図は百度地図を利用。緯度経度情報はgemのgeocoderを利用した。  

### 工夫した点
google map を使用しなかったのは、中国ではそれが利用できないからである(上述のように、本appは中国（大陸）での利用も想定している）。百度はAPIを公開しており（学習・研究用には無料）、それを利用した（但し、個人情報（中国携帯番号と中国身分証番号）の提供が必要で、外国人の利用は難しい）。また、実装には提供されているJSのコードを使用した。拡大や縮小、地図を航空写真に切り替える機能も無料で利用できる。日本版の地図はあまり精緻に作られていないが、目下最善の選択である。  

### 苦労した点、問題点  
当初、各mapのファイル（部分テンプレート）にheadの記述があったが、これだとAPIキーが個別に呼ばれてしまうせいか、検索結果が正しく表示されなかった。これについては、application.html.hamlに関連する記述を集約して解決。また、動きを軽くするために、第二の都市以降は当初は地図を表示させず、「表示」ボタンクリックで表示されるようにした。しかし、中国の地図については、第二の都市以降、地図の中心に該当する都市が表示されない（左上方にずれる）エラーが生じている(原因不明）。また、日本の都市については、中国の都市同様、簡体字の都市名を変数に入れて表示させるようにしているが、完全ではない。また、第二の都市以降、中心がずれるエラーはここでも生じている。百度の地図の座標は、中国の国家標準であるGCJ-02という火星座標系を、さらにアレンジしたBD-09というものを用いており、geocoderで取得したGPSの座標をそのまま用いることはできない。このため、百度ではこれを変換するオープンソースが用意されているが、計算方法はブラックボックスである（しかし、その中身を記述したソースがGithubには存在している（流出？）。但し私の理解を超えた内容）。上述のエラーを解決する方法として、変数を緯度および経度にするため、座標変換コードの利用を試みたが、日本の地図では全く正確に反映されなかった。海外には対応していない可能性が高い。このため、Githubのソースを利用しようとしたが、利用方法が分からず断念した。  

## 複数の都市情報の表示について・検索結果のアルゴリズムについて    
ボタンを４つ表示し、クリックするとほかの都市の情報を表示できるようにしている（JSを利用）。  

### 工夫した点  
毎回４つの検索結果があるとは限らない。結果が２都市の場合は２つ、３都市の場合は３つ、  
４都市以上は４つ表示されるようにした。また、類似緯度サーチについては、緯度の近い順に、  
類似気候サーチについては、雨量→平均気温の近い順に二段階ソートし、最も類似度の高い都市の情報が、  
まずは表示される仕組みになっている。本コーディングについては、paizaで日々練習していたことが  
役に立った。また、気候データが十分には揃っていないため（特に中国のマイナー都市）、エラーが表示  
されないように、該当が全くなかった場合はサーチ画面にredirect_toで戻れるようにコーディングした  
（以前はrenderを使用、1月13日変更）。かつフラッシュメッセージ（日中二か国語対応）を表示（同）。  

### 苦労した点、問題点  
当初はボタン一つで、都市の情報を入れ替える予定でいた。JSで全都市情報を取得し（gem gonを利用）、これをajaxでjpcitiesあるいはchcitiesのコントローラ内のアクションに送り（rotateという名にしていた）、中身の記述（配列.rotate で順番を一つずらせる）を動かしてビューに表示・・・ということを考えていたが、正解を思いつけなかった。このため、タブの仕組みを利用して、現在のような形となった。該当が全くなかった場合や、DBにレコードの無い都市が入力された場合のアルゴリズムは、if文を重層的に利用(サーチページへ自動リダイレクト）。このため、可読性が低下しているが、目下の実力では最善を尽くしたと思う。

＜中国の都市から日本の都市を検索した結果（類似緯度サーチ）＞
![中国の都市から日本の都市を検索した結果](https://user-images.githubusercontent.com/56028886/72042849-f315fb80-32f2-11ea-85d3-da61fdbcab99.png)
＜日本の都市から中国の都市を検索した結果（類似気候サーチ）＞
![日本の都市から中国の都市を検索した結果（類似気候サーチ）](https://user-images.githubusercontent.com/56028886/72044563-602b9000-32f7-11ea-840c-4373d99f0405.png)

*検索結果表示ページには、ツイッター型サイトのCSSプラグイン「BULMA」を応用させている。

# 今後の展開
現在は取り急ぎ緯度と気候サーチとしているが、表示させた（させたい）データの中には、不動産価格情報と年収情報がある。例えば年収について、私の肌感覚で言えば（為替レートとは関係無い）、税・社会保険料引き前月収30万円が同1万2000-3000元に相当する感じ（年収４００万円くらい）である。これを類似サーチできるようにしても良いかもしれない。但しお互いに敏感な情報であり、誤解を招かないようにしないとならないだろう。ちなみに不動産価格は中国社会では最も日常的な話題の一つである（特にビジネスの場合で）。このように、類似要素は様々に見いだせる。また、日本と中国との対照に限らない。このコンセプトは様々な場合に応用できる可能性があると思う。また、詳細はアップデート時に書き加えたいと思うが、考えの違いで個人間のみならず、社会が分断し、対立が激化する世界的傾向がある中で、共感力（power of compassion)は、非常に重要なキー概念と私は考えている。  

取り急ぎ以上ですが、今後もっと充実させてゆく予定です。  