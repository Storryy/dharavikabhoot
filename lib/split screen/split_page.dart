import 'package:flutter/material.dart';

class SplitScreen extends StatefulWidget {
  final int lyricsNumber;
  final List<String> hindiLyrics = [
    'धारावी की गलियाँ लोगों से कुछ कहना चाहती हैं। वो तुम्हें एक जिज्ञासा दिलाती हैं, एक ऊँचाई छूने की तलब जगाती हैं। तुम्हारे अंदर के जज़्बे को बनाती हैं और वही तुम्हारे सपनों को आकार देती हैं।कहने को तो काफ़ी सारी मुश्किलें होंगी यहाँ, लेकिन रास्ता भी लोगों का यही से है। सफ़र की शुरुआत आखिर यहाँ से ही है। कहते हैं ना, कहीं पहुँचने के लिए कहीं से निकलना ज़रूरी होता है।बस इन्हीं लोगों को ये गलियाँ एहसास दिलाती हैं इन बातों का और कहती हैं कि अगर सही वक्त पर शुरुआत न हुई, तो शायद ऐसे ही रह जाओगे।',
    'यहाँ के लोगों को गली गली के रास्ते पता हैं, बच्चे बुज़ुर्ग सबको, जैसे इनकी याददाश्त में छपा हुआ हो। ये शायद इन गलियों के रास्ते कभी न भटके, लेकिन यहाँ लोगों के सपने ज़रूर अपना रास्ता भटक जाते हैं। हर कोने में एक अलग सा सन्नाटा है। यहाँ हर शख्स कुछ एक चीज़ करता है अपने जुनून को छोड़कर। बस एक गुज़ारे के लिए। सबको अपनी पसंद पता ज़रूर है, लेकिन कब उसे पीछे छोड़ आते हैं, ये नहीं।\nइन गलियों में टहल के तो देखो, शायद आप भी इन्हें सुनना चाहो। शायद बहुत से किरदार और कहानियाँ तुम्हें भी नज़र आएँ। आखिर, ये आवाज़ें हमारे ही इन कानों को पुकार रही हैं। हर गली में आवाज़ें क़ैद हैं, क़ैद हैं तो इन घरों की दीवारों में, जो बस आपस में ख़ुसपुसाती हैं।\nभूलभुलैया है ये एक अनोखी सी,\nयहाँ के लोग रास्ते नहीं भटकते,\nभटकते हैं, तो यहाँ लोगों के सपने।\nहर गली में है हुनर यहाँ,\nफिर भी न जाने ये मिले कहाँ,\nना है इनका कोई आता पता,\nक्या सच में हैं ये लापता',
    "यहाँ के बच्चों में वो जज़्बा है जो इनके हुनर को रंग ला सकता है। जज़्बा एक, हुनर अलग, पहचान अलग।\nख़ानदानी हालातों की वजह से इन बच्चों को मजबूर कर दिया जाता है अपने हुनर को अलविदा कहने के लिए। इन्हें वही साइंस, कॉमर्स, आर्ट्स की पढ़ाई में धकेल दिया जाता है ताकि ये चाहकर भी अपनी दूसरी ख़्वाहिशों को पूरा न कर सकें। माँ-बाप को यह डर रहता है कि अगर बच्चा नाच-गाने और खेल के शौक़ लगाएगा, तो रोज़ी-रोटी कैसे कमाएगा?\nइनके सपनों की ऊँचाई समझो—आसमान तक। किसी को अपना नाम किसी बड़े स्टेडियम में सुनना है, तो शायद किसी को किसी बड़े स्टेज या पर्दे पर, या फिर कोई अख़बार में छपना चाहता है।\nमैं कोशिश हमेशा करूंगा,\nये आसमान मेरी हद है,\nज़िंदगी की बल्लेबाज़ी बाकी है मेरे दोस्त,\nकोशिश करना, यही मेरी आदत है। ",
    "शहरों में बस जाति के भेदभाव का एक अलग नाम और पहचान है, और वो है अमीर और ग़रीब। दुनिया मानो तो बस अमीरों के हुक़्म से चलती हो। उन्होंने आपस में इतना अंतर बना दिया है कि यहाँ लोग पास रहकर भी दूर हैं, मजबूर हैं। अमीरों के बीच शायद ही इन्हें कोई जगह मिले।\nइन पर दबाव इतना है कि खुद के सपने हासिल करना भी काँटों के रास्ते पर चलने जैसा है। हिप-हॉप और रैप की दुनिया भी कुछ ऐसी ही है, जहाँ बड़े-बड़े कलाकार जो बड़े ख़ानदानों से आते हैं, धारावी जैसी जगहों से उभरने वाले कलाकारों के लिए उनका ज़रिया मुश्किल बना देते हैं। कलाकार न सही तो बाकी लोगों से इन्हें नीचा दिखाया जाता है। और ये इनके हार मानने की वजह बन जाए, ऐसा हो नहीं सकता।",
    "क्या अमीर, क्या ग़रीब, क्या पढ़ा-लिखा, क्या अनपढ़—कुछ मर्दों की नीयत कभी सुधर नहीं सकती। इंसान को तुम ग़म देते जाओ, देते जाओ, और उसके लिए वो ग़म रोज़ाने हो जाता है।\nइस रोज़ाने में, ख़ुशी इतनी मुश्किल होती है कि ग़म को ही यहाँ हँसी में बदल दिया जाता है। फिर ये दर्द भी बस एक मज़ाक बनकर रह जाता है। ये अनकही बातें, अनसुनी आवाज़ बनकर दब सी जाती हैं। ऐसी आवाज़ें इन गलियों में गूंजती हैं, चीखती हैं। एक सहारा पाने की कोशिश करती हैं, लेकिन ज़्यादातर नाकामयाब रहती हैं।\nइन हालातों का असर उनके बच्चों पर भी पड़ता है। ये औरतें ऐसी ज़िंदगी में क़ैद हैं, जिसे उन्होंने इतना अपना लिया है कि अब आज़ादी के सपने देखना तो बहुत दूर की बात है।\nज़िंदगी मेरी इतनी झंड हो गई है,\nकि रो रोकर ये ग़म अब हँसी में बदल गई है।\nख़ुशी की इतनी कमी है, कि मैं चाहूं तो तुम्हारे हर सवाल का जवाब हँसी से दूं,\nबस ये दिल की एक झूठी तसल्ली हो गई है।",
    "यहाँ लोगों के जज़्बे को अकसर नीचाई दिखाई जाती है। ये जज़्बा शायद एक हो सकता है, लेकिन यह है अलग हुनर, अलग ख़्वाहिशों के लिए।कहानियाँ आपको ऐसी अनेक सुनने मिलेगी जहाँ इन गलियों के बाहर की दुनिया एक तकलीफ़ नहीं, बल्कि ये गलियाँ खुद एक तकलीफ़ हैं। अब पढ़ाई के दबाव में, शायद यहाँ नाच-गाने और खेलने की जगह बहुत कम है। और अगर नाच-गा भी लिया, तो किस तरह का? यही लोगों का सवाल रहता है।यहाँ गुज़ारे के लिए लोग बहुत कुछ करते हैं। वे अपने बच्चों से ये उम्मीद रखते हैं कि वे कुछ ऐसा करें जो उनकी रोज़ी-रोटी बनाए रखे और कभी तकलीफ़ न दे।\nआशाएँ तो एक ऐसी ज़िंदगी की हैं जो धारावी से अलग हो और बाहर हो। और उन्हें नहीं लगता कि ऐसे नाच-गाने का शौक उनके बच्चों को कहीं दूर तक ले जा सकता है",
    "कुछ लोग जहाँ धारावी से बाहर निकलने की कोशिश कर रहे हैं, तो वहीं शायद काफ़ी लोग ठहरे हुए हैं इस उम्मीद में कि शायद धारावी का ही नक्शा बदल जाए। ये आशाएँ रखते हैं कि धारावी खुद कैसे आगे बढ़ सके, उसकी खुद की उन्नति हो।आख़िर यहाँ के लोग इसकी मिट्टी से जुड़े हुए हैं। वे अपनी ज़िंदगी बदलना तो चाहते हैं, मगर शायद यहाँ से जुदा होने के सपने नहीं देखते। ये आशाएँ उन्हें वही नेता देते हैं, जो हर बार वादों का ढेर लगाते हैं और फिर भूल जाते हैं।\nएक झूठ के सहारे लोग गुज़ारा निकालते हैं। चाहकर भी ये आवाज़ें उठा नहीं सकते, और अगर उठाएँ भी तो ये अनसुनी रह जाती हैं। बस, ऐसी ही आशाओं और झूठी तसल्ली के बीच इनकी ज़िंदगी चलती रहती है।",
    "यहाँ की धड़कनें जितनी उदास लगती हैं, उतनी ही फ़नकार भी हैं। हिप-हॉप और रैप मानो यहाँ धड़कनों की आवाज़ है। जितनी ये गलियाँ शांत लगती हैं, उतनी ही शोर मचाती हैं, रफ़्तार पकड़ती हैं।जो आवाज़ें इन दीवारों में क़ैद सी रह जाती हैं, उन्हें ये कलाकार लोगों को सुनाते हैं—बस अपनी रोज़ाना ज़िंदगी को गाकर सुनाते हैं। ये निकलती तो इन्हीं गलियों से हैं, मगर फ़र्क़ बस इतना पड़ जाता है कि ये उन गलियों से आती हैं, जहाँ लोग आना नहीं चाहते, और न ही यहाँ के लोगों को बाहर आने देना चाहते हैं।लोग सिर्फ़ यहाँ के लोगों को ही नहीं, बल्कि इनके हुनर को भी नीचा दिखाते हैं। ऐसे हुनर को बहुत कम लोग ढूंढते हैं। यहाँ हुनर आपको हर तरफ़ मिलेगा, बस ढूंढने की बात है। अब यहाँ शायद इन्हें परिवार और दूसरे लोगों से सहारा मिले या न मिले, लेकिन दोस्त एक-दूसरे का बहुत सहारा देते हैं।\nअपने अंदर के हुनर को जब एक पहचान मिल जाए, तो बताओ, किसे अच्छा न लगेगा?",
    "घर भले ही छोटे हों, सपने ज़रूर बड़े हैं। यहाँ पतली गलियाँ इनके सपनों के रास्तों और सफ़र को मुश्किल ज़रूर बना देती हैं, लेकिन ये मुश्किलें यहाँ के जज़्बों से टल जाती हैं।काम और नाम ये ज़रूर बड़ा करना चाहते हैं। अकसर लोग इन छोटे घरों से निकले हुए लोगों को नाकामयाब समझते हैं। इन कमरों की चौड़ाई से इनके सपने और हुनर नहीं मापे जाते।",
    "कई सालों की मेहनत जब अपना फल दिखाती है, इन गलियों में खुशियों की महक उठ आती है। ये हिप-हॉप और रैप की आवाज़ें चाहती हैं कि कुछ सालों तक अनसुनी रहें। क्योंकि उन्हें पता है कि अगर ये आवाज़ें सुनी जाएँ, तो लोग इन्हें तुरंत दबा देंगे।\nइनके सपनों के सफ़र में रुकावटें लाई जाएँगी, जबकि पहले से ही काफ़ी मुश्किलें हैं। जब तक ये चुनौतियों से गुज़र कर वह नाम न कमा लें, ये चाहते हैं कि ये अनसुने ही रहें।\nजिस हुनर को लोग नकारते थे, वही हुनर जब बड़े पर्दे पर दिखता है, तो लोग उसका जश्न मनाते हैं। और कई बार, शायद कामयाबी पाने के बाद भी, इनके हालात वैसे के वैसे ही रह जाते हैं।",
  ];

  final List<String> englishLyrics = [
    "The walls and the lanes whisper to its people about the need to start at the right time. It ingrains the spirit of hunt, rigour and sincerity to work and fulfil their own dreams. It guides people in silence and loudness at the same time. There are enough struggles in dharavi, but it is a starting point after all for lives that have an invoked fire within them and take up pace to move ahead in life. It doesn't degrade them about their social conditions but simply makes them realize to follow their dreams and passion and live a content life.The voices have a certain weight, light or heavy, they are carried out in the city with these lives",
    "Be it a Mumbaikar or not, if you happen to be an outsider to this dense maze of Dharavi, you end up losing track of your route. A loop so tangled within itself , with every face a look alike. The loop is so ingrained in the memory of  the residents and localities of Dharavi. But that's about the map of routes, what about the map of their dreams? How often have they been kept a track of? Passion seems to get lost or stuck in the maze of life, that life is Dharavi.The lives here burdened with so much of social complexities are often dismissed of their own choices and dreams. Each corner echoes a hustle for survival and the same corner echoes a wish for accomplishment.\nA walk so silent, waiting to hear of voices, trapped in the walls that whisper only to themselves in silence. There's no lie in the talent that exists in these narrow lanes, and there's no lie that they struggle to breathe as well. These narrow lanes call for as broad opportunities as they can. Many knock at their doors as well, but is every knock answered? Each echo of talent is masked by some other voice, or maybe, they choose to? \nThey do seek the bright sun but fear if the dark chases them back.You hunt for the talent and it doesn't run away from you, it simply camouflages itself.So now you know, maybe the talent's not lost, but is hidden.",
    "The lanes of dharavi are filled with young enthusiastic spirits who are driven by their passion and talent. They have a rigorous attitude that draws them closer to their dreams. But little do these young voices get a chance to speak themselves out. Often these kids are restricted to service or job oriented fields of Science, commerce and arts. They are deprived of freedom to explore beyond these streams, which could be any creative field or any sports. They are too burdened with the academic pressure that they tend to lose touch with their own passion and talent. Parents fear if their children end up choosing such a path of career, they wouldn't earn and would fail to survive in the long run, with an existing lower social background. Each young voice awaits to be heard on a bigger platform and open up to a larger world",
    "Amidst the struggle of privilege and class, communities belonging to the underprivileged social background lack breathing equality .This equality is not just absent in space, but in status, opportunities etc. This often hinders the growth of individuals as well as the community.\nIt makes a separate base of competition rather to prove superiority, or rather say no space for them at all for competition, since they are deprived of opportunities. This doesn't put stop on the budding spirit, it might be an additive layer of obstructions on their path but they choose to not give up",
    "The lanes of dharavi are often heard screaming for help. These voices echo deep pain and frustration. Women and their voices here often remain ignored. They have been habitual of facing domestic violence. Their regular life has become prone to such violence which they often try resisting but many have sadly accepted their fate too. Scenarios, where these women are often found resisting and fighting against the patriarchy, are suppressed. This suppression and oppression remains a constant in society. What keeps building up as a regular chaos, becomes an accepted trauma for both the women and children. The youth that dwells into hip-hop and rap culture makes an attempt to represent these unheard voices.",
    "The spirit of the youth here in Dharavi is often questioned or rather forced to be a certain way. Family conditions and background take away the freedom of these spirits, which could be intentional or unintentional. The desires amongst the youth vary, each carries  a different story, a different wish and a different purpose. Talent is often dismissed here by its own people. Anyone who could be interested beyond academics, can be questioned or restricted from chasing their dreams. People tend to judge the choices these individuals can make for a living. Each one wishes and hopes for a life which is unlike dharavi and importantly, outside dharavi. Parents fear  hip-hop rap and similar cultures can obstruct their escape from here.",
    "Promises are meant to be broken and the politicians prove it. There are people who want to escape dharavi and then there are people who rather want to change the map of dharavi first. They envision a developed dharavi for themselves. People here, regardless of their social conditions, share an emotional connection with the place. They do wish for a better life but might not want to completely detach from here. Dharavi, happens to equally nourish them as well. Sadly, they have to live amongst the many lies that have been told by the politicians who are supposedly the ones to foster development. Corrupted politics makes the living of dharavi worse.",
    "Promises are meant to be broken and the politicians prove it. There are people who want to escape dharavi and then there are people who rather want to change the map of dharavi first. They envision a developed dharavi for themselves. People here, regardless of their social conditions, share an emotional connection with the place. They do wish for a better life but might not want to completely detach from here. Dharavi, happens to equally nourish them as well. Sadly, they have to live amongst the many lies that have been told by the politicians who are supposedly the ones to foster development. Corrupted politics makes the living of dharavi worse.",
    "Houses here are quite small and congested. They are a home to so many dreams and desires that they often outgrow the size of the house. Living so compacted, one does not trap themselves here and rather attempts at freedom. The small size doesn't stand at par measuring the size of their dreams. Their rigour and sincerity  makes their worth even more bigger and valuable. And one remains to be humble even after gaining success.",
    "After years of struggles and pain, when one makes it big out of dharavi, it's a moment of sheer happiness. The lanes that breathe hardwork and pain, start breathing a sense of relief and satisfaction. In the scenario of hip-hop culture, in the initial stages, people often choose to be underground artists. For many know that, once the voice is heard, people might willingly oppress them. The path is already burdened with other social issues that one doesn't want to hinder the journey more. They rather wait until they are heard on bigger platforms. Once out on the big screen, it's a Triumph. But not every screen accomplishment would make it a happy ending, some stay the same",
  ];
  bool isEnglish = true;
  SplitScreen({required this.lyricsNumber});

  @override
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9C1C1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/${widget.lyricsNumber}.png'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  widget.isEnglish
                      ? widget.englishLyrics[widget.lyricsNumber - 1]
                      : widget.hindiLyrics[widget.lyricsNumber - 1],
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.isEnglish = !widget.isEnglish;
                  });
                },
                child: Text(
                  widget.isEnglish
                      ? 'Hindi dikha rey!'
                      : 'Translate to English',
                  style: TextStyle(fontFamily: 'Consolas'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
