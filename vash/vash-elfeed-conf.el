(provide 'vash-elfeed-conf)

(setq-default elfeed-search-filter "@1-month-ago -junk +unread ")

(setq elfeed-feeds
      '(
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" youtube) ;DistroTube
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCwHwDuNd9lCdA7chyyquDXw" youtube) ;Bread on Penguins
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g" youtube) ;Protesilaos Stavrou
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCrqM0Ym_NbK1fqeQG2VIohg" youtube) ;Tsoding Daily
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCEbYhDd6c6vngsF5PQpFVWg" youtube) ;Tsoding
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ" youtube) ;ThePrimeTime
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw" youtube) ;ThePrimeagen
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg" youtube) ;Low Level
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ" youtube) ;System Crafters
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCZXW8E1__d5tZb-wLFOt8TQ" youtube) ;Bog
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCJetJ7nDNLlEzDLXv7KIo0w" youtube) ;Gavin Freeborn
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCLRILFZ-sHKYZ8io_IP5_ag" youtube) ;sudo love me baby
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCUSck1dOH7VKmG4lRW7tZXg" youtube) ;gingerBill
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCUzQJ3JBuQ9w-po4TXRJHiA" youtube) ;jdh
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCQG40havu4kNpB4pxUDQhYQ" youtube) ;Acerola
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" youtube) ;Luke Smith
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCSHZKyawb77ixDdsGog4iWA" youtube) ;Lex Fridman
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCQ-W1KE9EYfdxhL6S4twUNw" youtube) ;The Cherno
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCnN-3GfVjuEIHYo39HfhB1Q" youtube) ;Russel Walter
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCN__G2hSqRKuqedN3M0JCDg" youtube) ;Andrewism
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC0IwscwvxdXf4z437ZmXxlg" youtube) ;David Hart
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCi8C7TNs2ohrc6hnRQ5Sn2w" youtube) ;Programmers are also human
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCxa8XPOhu4iA6Lon71TJ0rg" youtube) ;Ampersand
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCR6LasBpceuYUhuLToKBzvQ" youtube) ;Solar Sands
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCxSiyTe60iQAY1UqCylNMmw" youtube) ;Linux Renaissance
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCrk2bNxxxLP-Qd77KxBJ3Xg" youtube) ;diinki
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC2WHjPDvbE6O328n17ZGcfg" youtube) ;ForrestKnight
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCxHAlbZQNFU2LgEtiqd2Maw" youtube) ;C++ Weekly With Jason Turner
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCEbS5GE-OOsvRhn21Hw_fGQ" youtube) ;Code Persist
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCMlGfpWw-RUdWX_JbLCukXg" youtube) ;CppCon
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCnhDCF3Slf9MlmYGIr47y-g" youtube) ;LinuxTechGeek
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCrx2zrPjhGRi9TwszZiLwEg" youtube) ;Horses
	("https://www.youtube.com/feeds/videos.xml?channel_id=UChkC4u4KdnIDFh9hPqExLDg" youtube) ;Low Level Game Dev
	; ("https://www.youtube.com/feeds/videos.xml?channel_id=" youtube) ;

	("https://archlinux.org/feeds/news/"            it read)
	("https://grishaev.me/feed.xml"                 it blog read)
	("http://nullprogram.com/feed/"                 it blog read)
	("https://danielsieger.com/atom.xml"            it blog read)
	("https://lukesmith.xyz/index.xml"              it blog read)
	("https://www.gingerbill.org/article/index.xml" it blog read)
	("https://andrewkelley.me/rss.xml"              it blog read)
	("https://poview.org/index.xml"                 it blog read)
	("https://protesilaos.com/master.xml"           it blog read)
	("https://xkcd.com/rss.xml"                     haha comics)

	; ("https://drewdevault.com/blog/index.xml"       it blog read)
	; ("https://harelang.org/blog//index.xml"         it blog language read)

	("https://leastaction.writeas.com/feed/" blog)
	))
