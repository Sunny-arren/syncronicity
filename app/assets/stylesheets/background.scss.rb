body {
  background-image: url("<%= asset-path("background_image.png") %>");
  filter: brightness(0.8);
  background-size: cover;
  height: 100vh;
  width: 100vw;
  font-family: 'Avenir','Helvetica Neue','Helvetica','Arial','Hiragino Sans','ヒラギノ角ゴシック',YuGothic,'Yu Gothic','メイリオ', Meiryo,'ＭＳ Ｐゴシック','MS PGothic'  
  }
body::before{
  content: '';
  position: absolute;
  top: -5px;
  bottom: -5px;
  left: -5px;
  right: -5px;
  background: inherit;
  filter: blur(2px);
}