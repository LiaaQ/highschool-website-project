<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DMPStranka.Default" 
    MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=ISO 8859-1" name="viewport"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <link rel="stylesheet" href="https://use.typekit.net/gul6euk.css"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet1.scss"/>
    <link href="styly.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
    <link href="player.css" rel="stylesheet" />
    <title>Natálie Teplická</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com"/>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@200;300&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.typekit.net/gul6euk.css"/>
    <link rel="icon" type="image/x-icon" href="obr/favicon.jpg" />
    <link rel="stylesheet" href="css/lightbox.css"/>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnRegistrace">

      <a href="#nahore" id="Nahoru">Nahoru &#8593</a>
        <div class="parallax" id="nahore">
            <asp:Label ID="lblPrihlasen" runat="server" Text=""></asp:Label>
            <asp:Button runat="server" ID="Registrace" CssClass="button" Text="Zaregistrovat" BorderStyle="Solid" Height="44px" Width="165px" OnClick="Registrace_Click"/>
             <asp:Button runat="server" ID="Prihlaseni" Text="Přihlásit" BorderStyle="Solid" Height="44px" Width="165px" CssClass="button" OnClick="Prihlaseni_Click" />
            <asp:Button runat="server" ID="Odhlaseni" Text="Odhlásit" BorderStyle="Solid" Font-Size="11pt" Height="44px" Width="165px" CssClass="button" OnClick="Odhlaseni_Click" />
        <br /><br />

            <div id="ModalRegister" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="nadpisRegistrace">Registrace</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body"><br />
                            <asp:TextBox CssClass="textbox" ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox><br /><br />
                            <asp:TextBox CssClass="textbox" ID="txtUser" runat="server" placeholder="Přezdívka"></asp:TextBox><br /><br />
                            <asp:TextBox CssClass="textbox" ID="txtHeslo" runat="server" TextMode="Password" placeholder="Heslo"></asp:TextBox><br /><br />
                            


                        </div>
                        <div class="modal-footer">
                         
                            <asp:Button ID="btnRegistrace" runat="server" Text="Zaregistrovat" OnClick="btnRegistrace_Click" CssClass="buttonModal" Width="120px" Height="40px"/>

                        </div>
                    </div>
                </div>
            </div>
            
            <div id="ModalLogin" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="nadpisRegistrace">Přihlášení</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <br />
                            <asp:TextBox ID="txtLoginUserOrEmail" runat="server" placeholder="Email nebo Přezdívka" CssClass="textbox"></asp:TextBox><br /><br />
                            <asp:TextBox ID="txtLoginPass" runat="server" TextMode="Password" placeholder="Heslo" CssClass="textbox"></asp:TextBox><br /><br />
                            


                        </div>
                        <div class="modal-footer">
                         
                            <asp:Button ID="btnLogin" runat="server" Text="Přihlásit" OnClick="btnLogin_Click" CssClass="buttonModal" Width="110px" Height="40px"/>
                            

                        </div>
                    </div>
                </div>
            </div>

            <div id="ModalNotif" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="nadpisRegistrace">Upozornění</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="registerUsernameError" runat="server" Text="Zadaná přezdívka již existuje." CssClass="Error"></asp:Label>
                            <asp:Label ID="registerEmailError" runat="server" Text="Zadaný email již existuje." CssClass="Error"></asp:Label>
                            <asp:Label ID="registerSuccess" runat="server" Text="Registrace proběhla úspěšně." CssClass="Error"></asp:Label>
                            <asp:Label ID="loginError" runat="server" Text="Zadali jste nesprávnou přezdívku nebo email." CssClass="Error"></asp:Label>
                            <asp:Label ID="loginPasswordError" runat="server" Text="Zadali jste nesprávné heslo." CssClass="Error"></asp:Label>
                            <asp:Label ID="loginSuccess" runat="server" Text="Byli jste úspěšně přihlášeni." CssClass="Error"></asp:Label>
                            <asp:Label ID="missingInfo" runat="server" Text="Nevyplnili jste jedno nebo více povinných polí." CssClass="Error"></asp:Label>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
            </div>
            
            <h1><span>Liaa.</span></h1>
    </div>

    <nav>
        <ul>
            <a href="#uvod"><li>O mně</li></a>
            <a href="#foto"><li>Ukázky</li></a>
            <a href="#jakzacit"><li>Jak začít</li></a>
            <a href="#flstudio"><li>FL Studio</li></a>
            <a href="#garageband"><li>GarageBand</li></a>
            <a href="#zacatky"><li>Začátky</li></a>
            <a href="#kontakt"><li>Kontakt</li></a>

        </ul>
        <div class="responsive_menu">Menu</div>
    </nav>

    <div class="content" id="uvod">
        <h2>O mně</h2>
            <p class="para"><a href="me.jpg" data-lightbox="image-1"><img id="imgja" src="me.jpg" /></a>
                Jmenuji se Natálie Teplická a jsem studentka průmyslové školy v Jihlavě. Od mala se věnuji hudbě, už ve školce jsem hrála na flétnu a od 6 let jsem se učila na housle. I přes to, že jsem se na ně učila 7 let, jsem na poslední 2 roky hudební školy přešla na bicí. Ty se staly mou oblibou a velmi mě to bavilo. Kromě hudebních nástrojů jsem už od mala velmi ráda zpívala. Nikdy jsem sice nechodila na oficiální hodiny zpěvu, ale věnovala jsem tomu hodně volného času. Proto jsem se také rozhodla pro to, aby hlavní částí mé maturitní práce bylo hudební CD.
            </p>
            <p class="para"><a href="obr/kira.jpg" data-lightbox="image-1"><img class="imgright" id="kira" src="obr/kira.jpg" /></a>
                Když mám náladu, ráda ve volném čase kreslím. Mým nejoblíbenějším "dílem" je kresba Kiry z Jojo's Bizarre Adventure. Nejraději kreslím v animovaném stylu.
            </p>
            <p class="para">
                Mojí další oblíbenou činností je učení se jazyků. Když jsem ještě byla na Gymnáziu, učila jsem se pár měsíců francouzsky, poté německy a také jsem chodila na dobrovolný kroužek španělštiny. V těchto jazycích jsem ale nepokračovala a zaměřila jsem se spíš na asijské jazyky. Začínala jsem s japonštinou, které už celkem dost dobře rozumím díky sledování japonských seriálů, ale od pokračování mě odradila japonská abeceda Kanji. Proto jsem se rozhodla přejít na korejštinu, hangul se lze naučit do dvou hodin a baví mě to o dost víc. Výlet do Koreji je jedním z mých největších životních snů.
            </p>
    </div>

    <div class="parallax2"></div>

    <div class="content" id="foto">
        <h2>Ukázky</h2>
        <div class="celky2">
            
            <div class="pisnecelek">
                <h3 id="bloodonyourhands" class="nadpisCovers">Blood on Your Hands</h3>
                <img src="obr/bloodonyourhands.jpg" class="covers" />
                <audio src="music/1_BloodOnYourHands.wav" controls=""></audio>
            </div>
            
        
            <div class="pisnecelek">
                <h3 id="thenightwemet" class="nadpisCovers">The Night We Met</h3>
                <img src="obr/thenightwemet.png" class="covers" />
                <audio src="music/2_TheNightWeMet.wav" controls=""></audio>
            </div>

            <div class="pisnecelek">
                <h3 id="dontseemto" class="nadpisCovers">Don't Seem To</h3>
                <img src="obr/DontSeemTo.jpg" class="covers"/>
                <audio src="music/3_Don'tSeemTo.wav" controls=""></audio>
            </div>

            <div class="pisnecelek">
                <h3 id="madworld" class="nadpisCovers">Mad World</h3>
                <img src="obr/madworld.jpg" class="covers" />
                <audio src="music/4_MadWorld.wav" controls=""></audio>
            </div>

            <div class="pisnecelek">
                <h3 id="borderline" class="nadpisCovers">Borderline</h3>
                <img src="obr/borderline.jpg" class="covers" />
                <audio src="music/5_Borderline.wav" controls=""></audio>
            </div>

            <div class="pisnecelek">
                <h3 id="borntodie" class="nadpisCovers">Born to Die</h3>
                <img src="obr/borntodie.jpg" class="covers" />
                <audio src="music/6_BornToDie.wav" controls=""></audio>
            </div>
        

            

            </div><br /><br /><br />
       <video src="obr/TheNightWeMet.mp4" controls=""></video>

        </div>

    <div class="parallax3"></div>
        <div class="content" id="jakzacit">
        <h2>Jak začít</h2>
        <p class="para">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pokud začínáte s hudbou, nejlepší způsob je pracovat nejdřív na coverech. Najít si nějakou ne příliš složitou píseň a zkusit ji přepracovat ve vámi vybraném programu. Vřele doporučuji FL Studio pro tvorbu vlastních MIDI. </p>
        <p class="para"><a href="obr/Chordify.jpg" data-lightbox="image-2"><img src="obr/Chordify.jpg" id="chordify" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jedním z nejužitečnějších nástrojů při tvorbě hudby pro mě byla stránka <a href="https://www.chordify.net/" target="_blank" class="chordifylink">Chordify</a>. Na této stránce se můžete dozvědět tempo (BPM), stupnici, a také akordy. To bylo pro mě hlavní pomocí při tvorbě písní. Když se vám zdá, že píseň zní moc nudně nebo stroze, přidání akordů do pozadí mnohokrát zlepší pocit z písně. Tuto metodu jsem použila například u písně Mad World vzhledem k tomu, že originál tento písně zahrnuje vpodstatě jen klavír. </p>   
        <p class="para">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pokud máte problémy s odposloucháváním tónů a s rytmem, nezoufejte. Když si vyberete známou píseň, s trochou štěstí můžete na internetu najít MIDI soubor, ve kterém jsou všechny vrstvy a nástroje přednastavené. Když tento soubor dáte do DAW programu, můžete libovolně experimentovat s nástroji, nebo vám to může pomoct zlepšit se v poznáváním tónů sledováním a učením se z tohoto již předvytvořeného projektu.</p>
        </div>
        <div class="parallax5"></div>
    <div class="content" id="flstudio">
        <h2>FL Studio</h2>
        <p class="para">FL Studio je pro mě v této chvíli nejoblíbenějším programem pro tvorbu hudby. Můžete zde využít nespočet různých pluginů se všemožnými funkcemi. </p>
        <p class="para"><a href="obr/FLEX.jpg" data-lightbox="image-3"><img src="obr/FLEX.jpg" class="imgright" id="flex"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jedním z mých nejoblíbenějších pluginů je FLEX. Najdete v něm stovky VST nástrojů pro MIDI záznamy. Každá píseň jde obohatit akordy danými do pozadí, které dají písni ihned bohatší pocit. Pro tyto účely využívám předinstalovaného balíčku pluginu FLEX, Arksun Cityscape. Nachází se zde různé elektronické nástroje, které se dají použít jak do pozadí písně, tak i jako lead. Moje oblíbené nástroje z tohoto balíčku jsou Dystopian Lead, Still Night a Blue Cordian. Dalším skvělým nástrojem je Fairy Sparkle, který se dá dobře použít i jako lead.<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dalšími balíčky, které bych ráda zmínila, jsou Essential Guitars, Bass Guitars a Pianos. Povedlo se mi s nimi vytvořit celkem slušné covery a zní opravdu atmosféricky a přirozeně. Všechny VST nástroje z tohoto pluginu mají přednastavené efekty, které se dají libovolně měnit, vypínat a přidávat.</p>
        
    </div>

    <div class="parallax4"></div>

         <div class="content" id="garageband">
        <h2>GarageBand</h2>
        <p class="para">GarageBand je vhodný pro ty, kteří s hudbou začínají. Při používání GarageBandu jsem ale občas měla pocit, že program více ovládál mě, než já jej. Proto jsem si více oblíbila FL Studio, ale moje první skladba, Don't Seem To, je vytvořena v GarageBandu.</p><br />
        <p class="para"><a href="obr/MIDI.png" data-lightbox="image-4"><img id="midi" src="obr/MIDI.png" /></a>Jednou z výhod GarageBandu je to, že můžeme melodie hrát přímo na digitální MIDI nástroje<br /> a nemusíme vlastnit fyzické, nebo vše zapisovat ručně do MIDI záznamů. Při hraní na digitální MIDI nástroj v GarageBandu si můžeme vybrat z několika módů. Základní mód se zde nazývá "glissando". Když přes klávesy přejedete prstem, noty se mění "ostře", jako byste přejeli rukou přes reálné piáno. Když ale vyberete mód "výška", noty se začnou měnit hladce, jako můžete slyšet například na začátku písně Don't Seem To. To je velmi užitečná funkce, jedinou nevýhodou je to, že zápis vytvořený tímto módem nejde poté měnit v MIDI záznamu.</p><br />
        <p class="para">Ruční hraní je ale velmi náchylné k nepřesnostem. K tomu ale slouží zápis MIDI, který se automaticky vytváří při hraní na MIDI nástroj. Do tohoto zápisu se můžeme dostat kliknutím na vrstvu, a vybráním možnosti "Upravit". Zde se nachází zápis, který můžeme vidět na obrázku. Libovolně můžeme měnit výšku not, délku not, sílu not atd. </p>
             </div>
        <div class="parallax5"></div>

            <div class="content" id="zacatky">
                         <h2>Začátky</h2>
                     <div id="secret" runat="server"><p class="para">Každý nějak začíná. Já osobně jsem se zpěvem začínala v aplikaci The Voice před asi 8 lety. Bohužel tyto nahrávky ale už nejsou dohledatelné, protože se mi smazal účet, což mě velmi mrzí. Používala jsem ale také mobilní aplikaci Smule, ve které můžete nahrávat svůj vlastní zpěv do písní a také zpívat s ostatními lidmi. Moje nejstarší dochovaná nahrávka z této aplikace je 7 let stará. Pro pobavení tady máte 2 ukázky mých duetů, když mi bylo 12 let... V nahrávce Chandelier zpívám jako druhá, v písni Apologize zpívám jako první.</p>
                         
                            <div class="celky">
                                <div class="pisnecelek2">
                         <h3 class="nadpisCovers2">Chandelier</h3>
                         <audio src="music/Chandelier.mp3" controls=""></audio></div>
                          
                          <div class="pisnecelek2" >    
                                <h3 class="nadpisCovers2">Apologize</h3>
                         <audio  src="music/Apologize.mp3" controls="" onvolumechange=""></audio><br /><br />
                            </div></div> 

                         <p class="para">Jako další mám na ukázku dvě písně zazpívané před dvěma lety - Mad World a The Night We Met. Tyto písně jsou také nově vypracované v mé maturitní práci, takže je vidět pokrok.</p>
                         
                            <div class="celky">
                                <div class="pisnecelek2">
                         <h3 class="nadpisCovers2">Mad World</h3>
                         <audio src="music/MadWorld.mp3" controls=""></audio>
                                </div>
                                <div class="pisnecelek2">
                         <h3 class="nadpisCovers2">The Night We Met</h3>
                         <audio src="music/TheNightWeMet.mp3" controls=""></audio>
                            </div></div>

                         <h2>BONUS</h2>
                         <p class="para">Zde je pro pobavení jeden (ne)povedený záběr z natáčení videa.</p>
                         <video src="obr/Ups.mp4" controls=""></video>
                     
                     </div>




                     <p id="secretPred" class="para" runat="server">Více se dozvíte, až se přihlásíte.</p>
                        <asp:Button runat="server" ID="RegistraceDole" CssClass="button" Text="Zaregistrovat" BorderStyle="Solid" Height="44px" Width="165px" OnClick="Registrace_Click"/>
             <asp:Button runat="server" ID="PrihlaseniDole" Text="Přihlásit" BorderStyle="Solid" Height="44px" Width="165px" CssClass="button" OnClick="Prihlaseni_Click" />
                     </div>
     
        <div class="parallax2"></div>
        
        <div class="content" id="kontakt">
                <h2>Kontakt</h2>
                 <div id="KontaktCele" runat="server">
                <asp:TextBox ID="txtJmeno" runat="server" Width="245px" Height="30px" CssClass="textbox" placeholder="Jméno"></asp:TextBox>
                <asp:TextBox ID="txtPredmet" runat="server" Width="245px" Height="30px" CssClass="textbox" placeholder="Předmět"></asp:TextBox><br /><br />
                <asp:TextBox ID="txtOdesilatelEmail" runat="server" Width="500px" Height="30px" CssClass="textbox" placeholder="Email"></asp:TextBox><br /><br />
                <asp:TextBox ID="txtZprava" runat="server" Width="500px" Height="100px" TextMode="MultiLine" CssClass="textbox" placeholder="Zde napište zprávu..."></asp:TextBox><br /><br />
                <asp:Label ID="lblInfo" runat="server" Text="" ></asp:Label><br />
                     <asp:Button ID="btnOdeslat" runat="server" Text="Odeslat" OnClick="btnOdeslat_Click" CssClass="button"/>
                 </div>
        
            </div>


         <div class="parallax3"></div>

    <div id="foot">
        <a href="https://www.facebook.com/natallienatt888/" target="_blank" ><img src="obr/fcb.png" width="70" style="padding-left: 30px; padding-top: 30px;" /></a>
        
        <p id="text"><center>&copy; Natálie Teplická 2022</center></p>
    </div>

        <script src="js/lightbox.js"></script>
        <script>
            lightbox.option({
                'disableScrolling': true
            })
        </script>



  <script>

      $('.responsive_menu').on('click', function () {
          $('nav ul').toggleClass('show');
      });

      document.querySelectorAll('a[href^="#"]').forEach(anchor => {
          anchor.addEventListener('click', function (e) {
              e.preventDefault();
              document.querySelector(this.getAttribute('href')).scrollIntoView({
                  behavior: 'smooth'
              });
          });
      });

      (function (d) {
          var config = {
              kitId: 'svn8gds',
              scriptTimeout: 3000,
              async: true
          },
              h = d.documentElement, t = setTimeout(function () { h.className = h.className.replace(/\bwf-loading\b/g, "") + " wf-inactive"; }, config.scriptTimeout), tk = d.createElement("script"), f = false, s = d.getElementsByTagName("script")[0], a; h.className += " wf-loading"; tk.src = 'https://use.typekit.net/' + config.kitId + '.js'; tk.async = true; tk.onload = tk.onreadystatechange = function () { a = this.readyState; if (f || a && a != "complete" && a != "loaded") return; f = true; clearTimeout(t); try { Typekit.load(config) } catch (e) { } }; s.parentNode.insertBefore(tk, s)
      })(document);

      $(window).on('unload', function () {
          $(window).scrollTop(0);
      });
     
  </script>
    </form>

  </body>
</html>
