Projede Frontend ASP.NET Web Form ile yapıldı. Backend ise .Net ile geliştirildi veritabanı olarak MSSQL kullanıldı Veri erişimi için ise ADO.Net kullanıldı
Projede iki ayrı fronend bulunmakta biri admin ve biri de Sigorta işlemleri yapılan katman
Bu katmanlar tek bir WebApi ile işlem yürütüyor 




https://user-images.githubusercontent.com/86763468/153768136-59a21ad8-8239-4f49-89be-4c2268b5e73c.mp4



https://user-images.githubusercontent.com/86763468/153769061-f4f9a510-ed65-441d-9f23-73c984f9a705.mp4




https://user-images.githubusercontent.com/86763468/153769072-7df6aa52-998c-4312-96ef-27743fc9bd64.mp4




https://user-images.githubusercontent.com/86763468/153769083-6fcb7ffd-1c13-4b5c-a512-5032be8704c9.mp4





https://user-images.githubusercontent.com/86763468/153769087-76f8be8d-d577-4299-adfb-c67c53775057.mp4






https://user-images.githubusercontent.com/86763468/153769094-f2f2be3e-350d-4c01-8fb2-7338557b55bd.mp4



![Ekran1](https://user-images.githubusercontent.com/86763468/153768179-f3e86b43-9d5c-4446-bfd4-0166e61bb034.PNG)

![Ekran Alıntısı2](https://user-images.githubusercontent.com/86763468/153768182-de249900-864d-4e44-b80e-ba1f6576d3b0.PNG)

![Ekran Alıntısı3](https://user-images.githubusercontent.com/86763468/153768183-5e741a35-9b52-49d7-80e6-c7a9fb0d50bf.PNG)

![Ekran Alıntısı4](https://user-images.githubusercontent.com/86763468/153768185-a204994f-ec92-485e-8ad6-16a8c1988407.PNG)

![Ekran Alıntısı6](https://user-images.githubusercontent.com/86763468/153768186-45795c3d-30b7-4a91-88f0-1d98aefec822.PNG)

Proje çalıştırılmak istenirse Db data ve shema scripti içerisinde mevcuttur


Bupa Acıbadem Sigorta FullStack Bootcamp Bitirme Projesi
● Service oriented yaklaşım ile geliştirilmiş iki farklı web uygulaması üzerinde
çalışılacak.
● Uygulamaları online sağlık poliçesi alma platformu senaryosu üzerinde kurgulanacak.
1. Uygulamada poliçe satın almak isteyen müşterilerin sigortalı kaydının yapılacağı, 3 adet
farklı poliçe ürününün (Ayakta Tedavi, Yatarak Tedavi, Yatarak + Ayakta Tedavi) temsili
olarak seçilip yine temsili primlerin gösterildiği (örn. Ayakta Tedavi ürünü 1000 TL, Yatarak
Tedavi ürünü 500 TL, Ayakta + Yatarak ürünü 1300 TL) ve sonucunda poliçenin peşin, 3
veya 6 taksitten birinin seçilerek temsili olarak satın alındığı bir ön yüz uygulaması
geliştirelim.
a. Bu önyüz uygulaması için .net core mvc, angular 11.x ve üzeri veya asp.net
webforms teknolojilerinden birisi ile geliştirilsin.
2. Uygulamada ise 1.uygulamadan yapılan girişlerin listeleneceği bir genel müdürlük ekranı
oluşturulsun. Herhangi bir login mekanizması kurulmasına gerek yok, sadece tek bir web
sayfası hazırlanıp mevcuttaki başvuruların listelendiği, sigortalı ad soyadının, seçilen
paketin, seçilen taksit adedinin, toplam primin gösterildiği bir ekran yapılsın. Bu ekranda
poliçelerin satın alınıp alınmadığı da bir grid üzerinde vb. belirtilmeli.
a. Bu önyüz uygulaması için .net core mvc, angular 11.x ve üzeri veya asp.net
webforms teknolojilerinden birisi ile geliştirilsin.
● Arka planda inşa edilecek web servisin .net core Web API olması tercih sebebidir.
WebApi üzerinden geliştirilme yapılmadığı durumda WCF veya ASMX’ de kabul
edilebilir. Geliştirilecek olan iki front-end’in direkt olarak database’e bağlanması
yerine geliştirilecek olan web servisleri üzerinden yapılması gereklidir.
● Veritabanı olarak Oracle kullanılması tercih sebebidir. Mümkünse bu senaryonun
gerçekleştirilmesi için gerekli olan iş kurallarının Oracle’daki Fonksiyon ve
Prosedürler içerisine yazılmasını; Entity Framework veya Nhibernate vb. Gibi bir
ORM yapısı kullanılmaması tercih sebebidir.
● Zorunlu olmamakla birlikte, geliştirilecek iki front-end uygulamasından birisinin
ASP.NET WebForms olması tercih sebebidir.
