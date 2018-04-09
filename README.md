# Gweinydd KALDI-ASR Cymraeg
## *Welsh language KALDI_ASR servers*


Defnyddiwch Docker er mwyn defnyddio Kaldi-ASR gyda dewis o ddau fodel / path defnydd: 

### macsen_v2.0
Er mwyn cynnal Macsen, y prototeip cynorthwyydd digidol Cymraeg sy'n ateb holiadau ar lafar ynghylch y tywydd, newyddion a nawr cynnwys Wicipedia Cymraeg

` $ make run model=macsen_v2.0 port=28081`

### dictation
Ar gyfer dibenion trawsgrifio gyda geirfa eang o'r Gymraeg. **N.B.** heb ragor o ddata hyfforddi mae'r modelau hyn yn hynod o wallus ac annigonol.

`$ make run model=dictation port=28080`


Gweler [README_original.md](README_original.md) am ragor o wybodaeth am docker-kaldi-gstreamer-server
