-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Giu 07, 2016 alle 08:26
-- Versione del server: 5.7.9
-- Versione PHP: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `page_assistance`
--

DROP TABLE IF EXISTS `page_assistance`;
CREATE TABLE IF NOT EXISTS `page_assistance` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  `Description` longtext NOT NULL,
  `Link` text NOT NULL,
  `Img` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `page_assistance`
--

INSERT INTO `page_assistance` (`Id`, `Title`, `Description`, `Link`, `Img`) VALUES
(11, 'Configurazione Mail su iPhone', '<p>Per aggiungere il tuo account di posta Alice su <strong>iPhone</strong>, tocca dal menu l''icona <strong>Impostazioni</strong>:</p><p><img alt="Icona impostazioni" src="images/assistenza/servizi/iPhone_impostazioni.jpg" style="width: 76px; height: 77px;"></p><p>Nelle <strong>Impostazioni</strong>:</p><ul class="acc_content"><li>scegli la voce <strong>Posta, contatti, calendari</strong></li><li>quindi <strong>Aggiungi account... </strong></li><li>dall''elenco dei provider vai su <strong>Altro</strong>:</li></ul><p><img alt="Aggiunta account email" src="images/assistenza/servizi/iPhone_mail_account.jpg"></p><ul class="acc_content"><li>tocca l''opzione <strong>Aggiungi account Mail</strong></li><li>compila i campi con i tuoi dati della casella di posta Alice:<ul class="acc_content"><li><strong>Nome</strong>: inserisci un nome a tua scelta;</li><li><strong>Indirizzo</strong>: il tuo indirizzo completo del dominio @alice.it;</li><li><strong>Password</strong>: digita la tua password di posta;</li><li><strong>Descrizione</strong>: inserisci un nome per specificare questo account (Alice, Casa, Ufficio, ...).</li></ul></li><li>tocca infine il tasto <strong>Avanti</strong>:</li></ul><p><img alt="Log in al servizio email" src="images/assistenza/servizi/iPhone_mail_login.jpg" style="width: 200px; height: 288px;"></p><p>L''iPhone nei passaggi successivi <strong>verifica automaticamente </strong>l''esistenza dell''account e il corretto funzionamento dei server di posta in entrata ed in uscita:</p><ul class="acc_content"><li>Se visualizzi il seguente avviso al termine della verifica ; tocca il tasto <strong>Si </strong>per completare la configurazione:</li></ul><p><img alt="Errore SSL" src="images/assistenza/servizi/iPhone_mail_error.jpg"></p><p>Per accedere alla casella di posta tocca l''icona <strong>Mail </strong>dal menu principale e seleziona il tuo account.</p><p><img alt="Icona email" src="images/assistenza/servizi/iPhone_mail_icon.jpg"></p><p><strong>N.B. </strong>iPhone configura in automatico la tua casella alice secondo il protocollo <strong>IMAP</strong>che permette di mantenere sincronizzata la tua mail con il server di posta; in questo modo anche l''eliminazione dei tuoi messaggi dal server avviene solo quando effettui la cancellazione da iPhone. Ti consigliamo di mantenere questa impostazione.</p><p> Se hai necessit&agrave; di configurare la mail su protocollo <strong>POP3 </strong>clicca sotto su ''Configurazione POP3'' </p><p>Se trovi comunque difficolt&agrave; nella configurazione, ti informiamo che &egrave; disponibile il nostro servizio di assistenza a pagamento <strong>SOS PC</strong>: il personale tecnico concorder&agrave; un <strong>intervento personalizzato</strong> per configurare in maniera ottimale il tuo iPhone.</p>', '1', 'Supporto Tecnico e Configurazione'),
(1, 'Attivazione linea di casa', '<p>Richiedere l''attivazione di una linea telefonica di casa &egrave; molto semplice. puoi:</p><ul class="acc_content"><li>richiederla online</li><li>chiamare&nbsp;il Servizio Clienti linea fissa&nbsp;187</li><li>recarti&nbsp;presso un Negozio TIM.</li></ul><p>Verifica la modalit&agrave; di attivazione consultando on line le varie offerte disponibili.</p><p>I dati necessari sono:</p><ul class="acc_content"><li>nome e cognome</li><li>codice fiscale</li><li>indirizzo dell''abitazione per cui richiedi l''installazione della linea</li><li>un recapito telefonico di cellulare</li><li>indirizzo email (facoltativo).</li></ul><p>Il nostro personale tecnico ti contatter&agrave; quanto prima per concordare l''appuntamento per l''installazione dell''impianto telefonico.</p>', '1', 'Gestione Linea e Servizi'),
(2, 'Variazione Abbonamento', '<p>Se hai cessato la tua attivit&agrave; professionale, puoi richiedere la variazione del tuo contratto di abbonamento telefonico.<br>Per richiedere la variazione chiama il Servizio Clienti 191.</p><p>Con la richiesta della trasformazione del contratto dalla categoria Affari ("A") alla categoria Residenziale ("B") il costo del tuo abbonamento mensile passer&agrave; da:</p><ul class="acc_content">	<li><strong>22,50</strong> &euro; (IVA esclusa) a <strong>17,54</strong> &euro; (IVA al 22% inclusa), in caso di <strong>linea</strong> telefonica di <strong>base</strong></li>	<li><strong>31,00</strong> &euro; (IVA esclusa) a <strong>20,17</strong> &euro; (IVA al 22% inclusa), in caso di <strong>linea ISDN</strong>.</li></ul>', '1', 'Gestione Linea e Servizi'),
(3, 'Restituzione prodotti', '<p>Per cessare il noleggio di un prodotto, con la conseguente interruzione del relativo abbonamento, basta chiamare il Servizio Clienti linea fissa 187 e poi consegnare o spedire il prodotto insieme al modulo di accompagnamento che puoi scaricare da questa pagina.<br>Se hai chiesto il recesso dal Contratto di Noleggio e Manutenzione devi restituire il prodotto in noleggio entro e non oltre 30 giorni dalla data della richiesta di cessazione/recesso del contratto, e consegnarlo presso i seguenti Negozi TIM:</p><ul class="acc_content"><li>ROMA: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viale Liegi, 31</li><li>MILANO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Piazza Cordusio snc - ang. Via Broletto</li><li>NAPOLI: &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Centro Direzionale - Isola A4</li><li>PALERMO: &nbsp; &nbsp; Via della libert&agrave;, 37/d</li><li>TREVISO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Via XX Settembre, 2</li></ul><p>oppure spedirlo a mezzo pacco postale a:&nbsp;</p><p>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; Telecom Italia S.p.A. c/o Geodis Logistics<br>&nbsp; &nbsp; &nbsp; &nbsp; Magazzino Reverse A22<br>&nbsp; &nbsp; &nbsp; &nbsp; Piazzale Giorgio Ambrosoli snc<br>&nbsp; &nbsp; &nbsp; &nbsp; 27015 Landriano PV</p><p><span style="font-size:9.0pt"><o:p></o:p></span></p><p>Al pacco postale devi allegare il modulo di accompagnamento che puoi scaricare da questa pagina.</p>', '1', 'Gestione Linea e Servizi'),
(4, 'Disattivare i servizi di linea fissa', '<p>Registrandoti alla nostra Area Clienti puoi gestire autonomamente la cessazione dei servizi attivi sulla tua linea telefonica; una volta entrato naviga all''interno de "La mia Linea"-"Servizi e Offerte Attivi" oppure su "il Mio Conto" all''interno del "Dettaglio Costi" della fattura.</p><p>I servizi che puoi disattivare sono i seguenti:</p><ul class="acc_content">	<li>Payforme: &egrave; un servizio attivo di default che puoi disattivare nella sezione "La mia Linea" - "Riepilogo".</li>	<li>Chi &egrave; : servizio che ti consente di visualizzare sul display del tuo telefono predisposto il numero di chi ti sta chiamando, da rete fissa o da rete mobile.</li>	<li>Memotel: <strong>la&nbsp;segreteria telefonica che puoi attivare sulla tua linea di casa</strong>.</li>	<li>Trasferimento di chiamata: il servizio che ti consente di trasferire anche sul tuo cellulare le chiamate in arrivo al tuo numero di casa.</li>	<li>Ultima chiamata persa:componendo il 42400 dal telefono fisso puoi conoscere l''ultimo numero, sia fisso che mobile che ti ha chiamato, la data e l''ora.</li></ul><p>In alternativa:</p><ul class="acc_content">	<li>chiama il Servizio Clienti 187.</li></ul>', '1', 'Gestione Linea e Servizi'),
(6, 'Richiedere un rimborso', '<p><strong>Rimborso per doppio pagamento</strong><br>Se desideri chiedere il rimborso per un pagamento gi&agrave; effettuato, chiama il Servizio Clienti 187. Ti sar&agrave; chiesto di lasciare un tuo recapito telefonico e sarai ricontattato, entro quattro giorni lavorativi, dal nostro ufficio amministrativo per verificare i dati inerenti ai pagamenti effettuati ed eventualmente concordare le modalit&agrave; per il rimborso.</p><p><strong>Rimborso per anticipo conversazioni nazionali</strong><br>Se hai aderito al servizio di domiciliazione bancaria della tua fattura e ti risulta ancora non accreditato il rimborso per anticipo conversazioni, chiama il Servizio Clienti 187. I nostri operatori effettueranno insieme a te tutte le opportune verifiche.</p><p><strong>Rimborso per fattura negativa</strong><br>Per conoscere tempi e modalit&agrave; di rimborso, chiama il Servizio Clienti 187. I nostri operatori effettueranno insieme a te tutte le opportune verifiche.</p>', '1', 'Controllo Costi e Pagamenti'),
(5, 'Gli elenchi telefonici a casa tua', '<p><strong>Il servizio di consegna degli elenchi telefonici</strong> consente di ricevere ogni anno, comodamente presso l''indirizzo di ubicazione del tuo impianto telefonico, gli elenchi degli abbonati di linea&nbsp;fissa TIM e degli altri gestori telefonici, aggiornati all''anno in corso. Il servizio <strong>NON comprende il ritiro degli Elenchi telefonici relativi alle precedenti&nbsp;edizioni</strong>.</p><p>Il servizio di <strong>consegna elenchi telefonici &egrave; a pagamento al costo annuale di 2,50 &euro; (IVA inclusa).</strong> Il costo del servizio &egrave; addebitato sulla Fattura TIM della linea di casa; <strong>non &egrave; dovuto alcun importo agli addetti incaricati della distribuzione.</strong></p><p>Ti ricordiamo che &egrave; possibile <strong>rinunciare gratuitamente in qualsiasi momento al servizio di consegna degli elenchi telefonici, </strong>contattando telefonicamente il Servizio Clienti linea fissa 187 o inviando una comunicazione scritta all''indirizzo Telecom Italia&nbsp; indicato sulla Fattura o al numero verde fax 800000187 del Servizio Clienti; in tal caso TIM provveder&agrave; a non addebitare pi&ugrave; il relativo importo.<br>Per ulteriori informazioni sul servizio o per richiederlo in caso di precedente rinuncia, ti invitiamo a contattare il Servizio Clienti&nbsp;187, a disposizione 7 giorni su 7, dalle 7.00 alle 22.30.</p>', '1', 'Gestione Linea e Servizi'),
(7, 'Conto Online: cosa cambia dal 1&deg; febbraio 2016', '<p>A partire dal 1&deg; febbraio 2016, &egrave; cambiata&nbsp;la disciplina delle modalit&agrave; di fatturazione per i clienti ADSL e Fibra per incentivare l''utilizzo del servizio gratuito di ricezione on line della fattura in formato esclusivamente elettronico.</p><p>AI clienti ADSL e Fibra che hanno attiva la domiciliazione bancaria o postale e che abbiano un indirizzo di posta elettronica associata al Servizio (@alice.it o @tim.it), verr&agrave; attivato in automatico il servizio di ricezione delle fatture in formato esclusivamente elettronico (Conto Online).</p><p>Tale servizio consiste nella notifica via mail della possibilit&agrave; di visualizzare la fattura nella sezione MyTIM Fisso del sito&nbsp;<strong>tim.it</strong>&nbsp;e dunque nell''eliminazione della fattura&nbsp;cartacea e dei relativi costi. &nbsp;</p><p>Per tutti i clienti che non hanno la domiciliazione attiva, che non hanno un indirizzo e-mail associato al servizio, o che hanno scelto di non aderire al Conto Online, verr&agrave; mantenuto l''invio della fattura&nbsp;cartacea. Per questi clienti sar&agrave; addebitato un importo mensile di 2 euro IVA inclusa, comprensivo delle spese di spedizione.</p><p>Per eliminare l''invio della fattura&nbsp;cartacea e dei relativi costi, &egrave; possibile passare al Conto Online&nbsp; attivando la domiciliazione dei pagamenti e, se non si dispone di un indirizzo di posta elettronica associato al Servizio, &nbsp;richiedendone uno su <strong>https://mail.alice.it/</strong>&nbsp;direttamente dalla linea ADSL o Fibra di casa.</p><p>L''attivazione del servizio di domiciliazione bancaria su MyTIM Fisso &egrave; gratuita e gestibile direttamente&nbsp;<strong>online</strong>.</p><p>Per ulteriori dettagli sulla modifica&nbsp;delle Condizioni Generali dei contratti ADSL e FIBRA&nbsp;(adeguamento articolo&nbsp;"Condizioni economiche e modalit&agrave; di pagamento") ti rimandiamo alla lettura della relativa <strong>news</strong>.</p>', '1', 'Controllo Costi e Pagamenti'),
(10, 'Modalit&agrave; di pagamento della fattura linea mobile', '<p>Se non hai gi&agrave; attiva una domiciliazione, &egrave; possibile effettuare il pagamento della fattura utilizzando una delle seguenti modalit&agrave;:</p><ul class="acc_content"><li>Tramite&nbsp;il servizio&nbsp;<strong>P@gonline</strong>. Accedi a <strong>MyTIM Mobile</strong>. Se sei titolare di una Carta di Credito dei circuiti VISA, MASTERCARD o AMERICAN EXPRESS, potrai utilizzarla per effettuare il pagamento delle fatture da saldare, senza costi aggiuntivi, in modo semplice e sicuro.<br>Al termine dell''operazione, riceverai conferma di avvenuto pagamento all''indirizzo email indicato in fase di registrazione a MyTIM Mobile.&nbsp;<br>Ti ricordiamo che non &egrave; possibile effettuare il pagamento di pi&ugrave; fatture con un''unica transazione.</li><li>Tramite i circuiti&nbsp;<strong>Lottomatica Servizi e Sisal</strong>. Recandoti in un qualsiasi punto vendita autorizzato su tutto il territorio nazionale, puoi effettuare il pagamento consegnando all''addetto del punto vendita il bollettino postale premarcato allegato alle nostre comunicazioni o in alternativa comunicando il tuo numero di telefono e l''importo del rendiconto telefonico da saldare.&nbsp;<br>Al termine dell''operazione verr&agrave; rilasciata una ricevuta di attestazione di avvenuto pagamento.&nbsp;<br>Ti ricordiamo che dai punti vendita &egrave; possibile pagare in contanti o&nbsp;con carta bancomat e, dai siti web dei circuiti, con carta di credito.</li><li>Attraverso il&nbsp;<strong>bollettino premarcato</strong>&nbsp;allegato alle nostre fatture (se ricevi la fattura cartacea) o comunicazioni, utilizzabile presso tutti gli uffici postali e presso gli sportelli degli Istituti di Credito convenzionati;</li><li><strong>Altre modalit&agrave;</strong>: &egrave; possibile effettuare il pagamento su Conto Corrente postale n.ro 28027001 (compilando un bollettino in bianco) intestato a TELECOM ITALIA S.p.A. Via Gaetano Negri 1 - 20123 MILANO o tramite bonifico bancario da effettuare sulle coordinate "BANCA INTESA SPA - Iban&nbsp; IT&nbsp; 16&nbsp; N&nbsp; 03069&nbsp; 05073 000000610115".&nbsp;<br>Nella causale di versamento sar&agrave; necessario indicare sempre il numero dell''utenza, la denominazione sociale o nome e cognome&nbsp;del titolare del contratto ed il bimestre di riferimento.&nbsp;<br>In caso di utilizzo di queste ultime due modalit&agrave; di pagamento, ti invitiamo a comunicare telefonicamente gli estremi di pagamento al Servizio Clienti 119. Nel caso in cui la tua linea sia stata sospesa sar&agrave; necessario&nbsp;inviarci la copia della ricevuta attestante l''avvenuto pagamento.<br>Se hai gi&agrave; registrato la tua linea a <strong>MyTIM Mobile</strong>, puoi&nbsp;compilare ed inviare direttamente <strong>online</strong> la "Richiesta di riattivazione linea e comunicazione estremi di pagamento" disponibile nella sezione <strong>MODULI</strong>&nbsp;sotto la voce "Clienti con abbonamento" allegando la<strong> </strong>copia della ricevuta.&nbsp;Se non sei registrato potrai inviare la copia della ricevuta di pagamento secondo le modalit&agrave; indicate dal Servizio Clienti 119.</li></ul><p>Ti ricordiamo che...</p>Puoi decidere in ogni momento di attivare il&nbsp;<strong>pagamento automatico</strong>&nbsp;sul tuo Conto Corrente o sulla tua Carta di Credito della tua fattura, in modo da non doverti pi&ugrave; preoccupare della data di scadenza.&nbsp;', '1', 'Controllo Costi e Pagamenti'),
(8, 'Verifica credito residuo e bonus disponibili per i clienti Prepagati', '<p>Il credito residuo disponibile, le offerte e lo stato dei&nbsp;bonus attivi sulla tua linea ricaricabile, sono consultabili attraverso le seguenti modalit&agrave;:</p><ul class="acc_content"><li>Direttamente dal tuo Smartphone, accedendo&nbsp;all''<strong>app MyTIM Mobile</strong>, attualmente disponibile in download gratuito nelle versioni per iPhone e per smartphone con sistema operativo Android.</li><li>Direttamente online sul sito tim.it nella sezione&nbsp;MyTIM Mobile&nbsp;riservata ai nostri clienti che ti permette di verificare il credito residuo, le quantit&agrave; di minuti, SMS, GB ancora disponibili, i bonus in euro &nbsp;eventualmente presenti&nbsp;ed effettuare variazioni sulla tua linea telefonica;</li><li><strong>Chiamando il numero gratuito 40916,</strong>&nbsp;per il credito residuo. Inoltre digitando il tasto 1 puoi conoscere le offerte attive, la quantit&agrave; di minuti, SMS, GB ancora disponibili e i bonus in euro eventualmente presenti;</li><li>Attraverso il&nbsp;<strong>servizio gratuito&nbsp;</strong>119sms;<strong>&nbsp;inviando un sms al 119</strong>&nbsp;"a testo libero"(ad esempio "qual &egrave; il mio credito residuo") il servizio ti risponder&agrave; con un sms con le informazioni richieste;</li>\r\n\r\n\r\n<li>Attraverso l''attivazione del&nbsp;<strong>servizio gratuito </strong>"TIM Ti Avvisa&nbsp;- info sms"&nbsp;che ti permette di conoscere il costo dell''ultima chiamata nazionale effettuata e il credito residuo aggiornato in tempo reale grazie alla ricezione di un sms direttamente sul tuo telefonino oppure con il servizio "TIM Ti Avvisa - offerte" puoi essere informato con un sms gratuito quando il consumo delle tue offerte attive raggiunge la percentuale da te scelta;</li>\r\n\r\n\r\n\r\n</ul><p>&nbsp;<br>Se sulla tua linea sono presenti&nbsp;offerte e bonus in euro, la priorit&agrave; di consumo segue generalmente&nbsp;il seguente criterio:</p><p>1. Minuti, sms, GB inclusi nell''offerta attiva;</p><p>2. Bonus in euro con scadenza;</p><p>2. Bonus in euro senza scadenza;</p><p>3. Credito residuo.</p><p>In presenza di due o pi&ugrave; bonus &egrave; prioritario quello con scadenza pi&ugrave; immediata.</p><p>Ti ricordiamo che il bonus in euro non pu&ograve; essere utilizzato per <strong>le chiamate internazionali</strong>, per le chiamate verso numerazioni non geografiche (in Italia e all''estero) e per il <strong>traffico roaming</strong> (ad eccezione del traffico roaming dati).</p><p>Per ulteriori dettagli sulle condizioni di utilizzo dei bonus in euro presenti sulla tua linea, consulta la pagina dedicata nella sezione Offerte del sito tim.it.</p><p>Ti ricordiamo infine che per poter usufruire delle offerte&nbsp;e degli eventuali bonus in euro presenti sulla linea, il credito residuo della tua SIM deve essere maggiore di zero.</p>', '1', 'Controllo Costi e Pagamenti'),
(9, 'Le promozioni e i rinnovi automatici per Clienti Ricaricabili', '<p>Se hai una linea Ricaricabile ed hai acquistato una Promozione che prevede il rinnovo periodico di un bundle di traffico in chiamate, SMS o navigazione Internet, ti ricordiamo che il rinnovo dell''opzione avverr&agrave; al massimo entro 4 ore dalla mezzanotte della data di scadenza prevista dall''offerta. Il rinnovo &egrave; sempre confermato con un SMS.</p><p>Ti ricordiamo di verificare che il giorno del rinnovo la tua TIM Card disponga di un credito sufficiente.</p><p>Prima di usufruire del servizio ti invitiamo comunque a verificare l''avvenuto rinnovo del bundle previsto dalla Promozione contattando il numero gratuito <strong>40916</strong> (per Clienti Ricaricabili).</p><p>Inoltre potrai sempre verificare lo stato della tua Promozione consultando l''<strong>MyTIM Mobile</strong>, navigando dal telefonino sul sito <strong>TIM.it ottimizzato per il tuo Smartphone</strong>, oppure attraverso l''<strong>app MyTIM Mobile</strong>.</p><p><strong>N.B.</strong><br>Ti ricordiamo che in caso di navigazione Internet senza offerta dati attiva o rinnovata si applica la <strong>tariffa dati base</strong>.</p>', '1', 'Controllo Costi e Pagamenti');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
