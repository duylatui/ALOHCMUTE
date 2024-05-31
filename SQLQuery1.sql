-- Tạo bảng Người dùng (User)
create database social_network
go
use social_network
go
CREATE TABLE Users(
    UserID INT PRIMARY KEY identity(1,1),
    UserName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    AvatarURL VARCHAR(255),
	Admin Int  DEFAULT 0
);
INSERT INTO Users (UserName, Email, Password, AvatarURL)
VALUES 
  ('JohnDoe', 'john@example.com', 'hashed_password', 'avatar_url.jpg'),
  ('JaneDoe', 'jane@example.com', 'hashed_password', NULL),
  ('BobSmith', 'bob@example.com', 'hashed_password', 'bob_avatar.jpg');


-- Tạo bảng Bài viết (Post)
CREATE TABLE Post (
    PostID INT PRIMARY KEY identity(1,1),
    Content nvarchar(1000),
    PostTime DATETime,
    ImageVideoURL VARCHAR(255),
    Likes INT DEFAULT 0,
    Comments INT DEFAULT 0,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tạo bảng Bình luận (Comment)
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY identity(1,1),
    Content nvarchar(255),
    CommentTime DATETime,
    UserID INT,
    PostID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tạo bảng Thích (Like)
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY identity(1,1),
    UserID INT,
    PostID INT,
    CommentID INT,
    LikeTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (PostID) REFERENCES Post(PostID)  ,
    FOREIGN KEY (CommentID) REFERENCES Comment(CommentID)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FriendRequest (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT,
    ReceiverID INT,
    IsAccepted int DEFAULT 0, -- 0: Chưa được chấp nhận, 1: Đã chấp nhận
    FOREIGN KEY (SenderID) REFERENCES Users(UserID) ,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- Tạo bảng Kết bạn (Friendship)
CREATE TABLE Friendship (
    FriendshipID INT PRIMARY KEY identity(1,1),
    User1ID INT,
    User2ID INT,
    FOREIGN KEY (User1ID) REFERENCES Users(UserID) ,
    FOREIGN KEY (User2ID) REFERENCES Users(UserID) 
);







-- Tạo bảng Tin nhắn riêng (Private Message)
CREATE TABLE PrivateMessage (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SenderUserID INT,
    ReceiverUserID INT,
	Timestamp DATETIME,
    MessageContent nvarchar(255),
    FOREIGN KEY (SenderUserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (ReceiverUserID) REFERENCES Users(UserID)  
);
-- Thêm một dòng dữ liệu mới
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (1, 2, N'a xin chao b');

-- Thêm một dòng dữ liệu khác
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (2, 1, N'b xin chao a');
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (1, 2, N'a hoi tham b');

-- Thêm một dòng dữ liệu khác
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (2, 1, N'b van khoe');
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (3, 1, N'c van khoe');
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (3, 1, N'a van khoe');
INSERT INTO PrivateMessage (SenderUserID, ReceiverUserID, MessageContent)
VALUES (2, 1, N'a muon di choi vs b k');
--SELECT * 
--FROM PrivateMessage
--WHERE (SenderUserID = 1 AND ReceiverUserID = 2) 
--   OR (SenderUserID = 2 AND ReceiverUserID = 1)
--ORDER BY MessageID;
  INSERT INTO Users (UserName, Email, Password, AvatarURL, Admin)
VALUES
( 'Justin Bieber', 'justin@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345927/191985192_340690064079968_5750107449348201486_n.jpg', 0),
( 'Taylor Swift', 'taylor@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345325/395322075_887029789455507_5464756512007097422_n.jpg', 0),
( 'Son Tung M-TP', 'sontung@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346230/343203762_1597178617434010_981793631601911140_n.jpg', 0),
( 'Tran Thanh', 'tranthanh@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346577/408457784_950588633098073_5190397068532859986_n.jpg', 0),
( 'Le Duong Bao Lam', 'baolam@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346985/354918321_864875338317184_7627481692900444807_n.jpg', 0),
( 'Adele', 'adele@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347187/245742374_418348206314046_2586367729164210322_n.jpg', 0),
( 'Snoop Dogg', 'dogg@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347353/334119891_1839776246381802_4788017001483120327_n.jpg', 0),
( 'Dwayne The Rock Johnson', 'rock@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702348605/143527250_268572467960571_555300739818054970_n.jpg', 0),
( 'Tom Cruise', 'tom@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349013/1467305_10150380113239980_1783008054_n.jpg', 0),
( 'Alan Walker', 'alan@gmail.com', '1', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349302/359501709_829328728557248_4538031221933794166_n.jpg', 0);





-- Inserting values into the Post table
INSERT INTO Post (Content, PostTime, ImageVideoURL, Likes, Comments, UserID)
VALUES 
('Khanh Learn and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-05 12:30:00.000', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702103849/images.png', 10, 5, 1),
('Houses and relics in the officially-recognized traditional Northern Vietnamese village of Duong Lam, a “preserved” national historical and cultural site, are crumbling, but authorities haven’t obtained funding for restoration.', '2023-12-06 15:45:00.000', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702103849/images.png', 15, 8, 2),
('Your content here', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702103849/images.png', 1000, 100, 3),
('Learning that their daughter had a bile duct cyst, an Australian couple took her to Vietnam for a single port laparoscopy, a technique available only in Vietnam and China.', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702103849/images.png', 111, 12, 3),
('All leaders at AVT have more than 10 years of experience in project management and interior design–build in various countries like Japan.', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702103849/images.png', 123, 123, 1),
('Khanh and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702104594/avt.jpg', 12, 0, 6),
('Netflix is an American subscription video on-demand over-the-top streaming service. The service primarily distributes original and acquired films and television shows from various genres, and it is available internationally in multiple languages', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702285632/408980698_657227593252918_3355681174817442329_n.jpg', 1233, 0, 1),
('ALearn and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702283448/403651475_120201479725540006_1678454842522301892_n.jpg', 431, 0, 2),
('Khanh and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-11 15:43:22.473', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702283448/403651475_120201479725540006_1678454842522301892_n.jpg', 432, 0, 3),
('Khanh and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-11 15:48:00.523', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702283448/403651475_120201479725540006_1678454842522301892_n.jpg', 111, 0, 6),
('Khanh and practise useful English language for everyday situations with the BBC. A weekly instruction manual for saying or doing something in English is published every Thursday.', '2023-12-12 09:55:00.600', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702301357/330866747_23852906867080232_3798527336820806034_n.jpg', 231, 0, 6),
('Sam Lansky has such a wondrous way with words, and I’ve loved reading his pieces for over a decade. If you’ve ever been around him, you know he’s just the best type of person: Curious. Interested. Hilarious. Intriguing and intrigued. I have tRuSt iSSueS when it comes to interviews but I couldn’t be happier that I did this one with him. I was blown away to see quotes from people I adore and admire like Stevie Nicks, Greta Gerwig, Shonda Rhimes, Phoebe Bridgers, Natalie Maines,…', '2023-12-12 08:43:57.873', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345439/406430893_903794794445673_4382946058611267517_n.jpg', 64, 0, 2),
('Watching Kendrick Lamar create and record his verses on the Bad Blood remix was one of the most inspiring experiences of my life. I still look back on this collaboration with so much pride and gratitude, for the ways Kendrick elevated the song and the way he treats everyone around him. Every time the crowds on The Eras Tour would chant his line ‘you forgive, you forget, but you never let it… go!’, I smiled. The reality that Kendrick would go back in and re-record Bad Blood so', '2023-12-12 08:45:40.263', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345541/396499514_887217806103372_6184986851309452976_n.jpg', 234, 0, 2),
('What a truly mind-blowing thing you’ve turned The Eras Tour Concert Film into. I’ve been watching videos of you guys in the theaters dancing and prancing and recreating choreography, creating inside jokes, casting spells, getting engaged, and just generally creating the exact type of joyful chaos we’re known for 😇 One of my favorite things you’ve done was when you supported Cru', '2023-12-12 09:37:19.153', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345662/391619839_882587916566361_4224863053959369558_n.jpg', 5675, 0, 2),
('It’s a new soundtrack 💙 Here are the back covers and vault track titles for 1989 (my version) I can’t wait for this one to be out, seriously. Thank you for playing along, sleuthing, puzzling and making these reveals so much chaotic fun (which is the best kind of fun, after all 😜)', '2023-12-12 08:58:48.843', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345735/381584994_867055624786257_409833761906139890_n.jpg', 2432, 0, 2),
('Oh hi guys! The Aquamarine Green Edition of 1989 (my version) is available on my site for the next 48 hours 😎 http://taylor.lnk.to/1989TaylorsVersion', '2023-12-12 08:49:49.567', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345791/369964566_851314083027078_1612410815915289138_n.jpg', 6456, 0, 2),
('😘😘😘', '2023-12-12 08:52:54.503', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702345976/329664064_677998374121926_498023688317715595_n.jpg', 363, 0, 1),
('Thinkin of renting a van and going radio station to radio station like the good ol days Ryan Good, DJ Tay James, Pattie Mallette LOVE YOU GUYS', '2023-12-12 09:55:00.600', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346024/317837900_729907655158205_7321246785213539106_n.jpg', 657, 0, 1),
('LOVE YOU TOKYO 🇯🇵 UNTIL NEXT TIME', '2023-12-12 08:54:33.717', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346075/317566916_726940192121618_7389092891175190789_n.jpg', 311, 0, 1),
('❤️❤️❤️❤️❤️❤️', '2023-12-12 08:55:18.327', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346120/317492551_726932385455732_3405225191742350571_n.jpg', 12, 0, 1),
('Every beautiful thing in this world starts with a dream … 🦋✨🫧', '2023-12-12 08:57:46.987', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346268/409174019_921838219298572_314669420920964816_n.jpg', 124435, 0, 3),
('Everyone has their own way, but by 2023, Wrapped will share the same way with #SonTungMTP ✨✨✨ Now, show me your way and enjoy the new chapter! 🕊️🕊️🕊️ Spotify #SpotifyWrapped #SpotifyVietnam', '2023-12-12 08:58:48.843', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346330/408393905_919752432840484_3562702354431383845_n.jpg', 6456, 0, 3),
('HÀ NỘIIII ĐÊM QUA QUÁ LÀ CHÁYYYYYY 🔥🔥🔥', '2023-12-12 08:59:37.077', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346378/405263506_918225116326549_469475181307247350_n.jpg', 1212, 0, 3),
('SKY MÃI LÀ SỐ 1   🔥', '2023-12-12 09:00:16.033', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346417/403680272_914571740025220_8351134837187413729_n.jpg', 245, 0, 3),
('Muốn uống gì khônggg ??? Hôm nay tui mờiiiiiiiiiiiiiiiiiiii 😌', '2023-12-12 09:53:58.037', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346451/402085681_909412997207761_3889324495079692009_n.jpg', 789, 0, 3),
('Tell me your secrets 🤍', '2023-12-12 09:01:32.013', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346493/394593495_899875008161560_2592101242887671908_n.jpg', 377, 0, 3),
('Teaser Poster đầu tiên của MAI.  Lưng ải lưng ai??????    Lưng ai mà sexy thế này??????  MÙNG 1 TẾT, cả nhà này ra rạp ủng hộ em và thưởng thức tấm lưng này nhé!!!!! … ', '2023-12-12 09:03:25.213', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346606/408630958_950893953067541_3949038957438517934_n.jpg', 75, 0, 6),
('Anh đạo diễn trẻ!!!!!', '2023-12-12 09:03:59.147', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346640/405467726_949551653201771_4962124150647161350_n.jpg', 747, 0, 6),
('Khi vợ chụp hình có tâm!!!  Chắc bữa nay bả có chuyện zui!!!!!!', '2023-12-12 09:04:27.690', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346669/405393925_948439766646293_5271577723548514196_n.jpg', 87, 0, 6),
('Tuyển tập những comment dễ thương khán giả dành cho First Look của phim MAI. Cảm ơn quý vị đã thương MAI. #phimMai', '2023-12-12 09:04:59.467', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346700/407724958_947531093403827_6068319597256317688_n.jpg', 34, 0, 6),
('Chết tui!  Cuối năm có ai bận rộn nhà bao việc như tui không?  Tui xin phép chia sẻ một bí kíp tuyệt vời để tỉnh táo và tập trung: uống Boss cà phê sữa thơm ngon ngọt béo ☕️  Dù đang làm việc giữa giờ hay đêm khuya thức chạy deadline thì tui thấy uống lon cà phê sữa Boss cũng hợp lý lắm nè. Vị ngọt ngọt, thơm thơm từ cà phê, mà dạng lon tiện lợi chỉ khui ra và thưởng thức được từng ngụm cà phê thơm ngon rồi đó', '2023-12-12 09:06:11.113', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702346772/405311480_946823683474568_1519439523176225323_n.jpg', 78, 0, 6),
('Lê Dương Bảo Lâm phiên bản nữ ❤️', '2023-12-12 09:03:25.213', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347029/406819173_964956978309019_3785720255881538860_n.jpg', 765, 0, 7),
('Công thức đẹp trai … Là im im …  Ánh mắt xa xăm … Nhìn vào điện thoại  Chúc các anh thành công ❤️', '2023-12-12 09:43:55.947', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347066/406482571_964417225029661_6612008579325381749_n.jpg', 789, 0, 7),
('Weekend 34', '2023-12-12 09:13:38.010', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347219/398289062_889806072501588_8117115555508507161_n.jpg', 456, 0, 8),
('Tickets go on sale 26th October, for more information and to register for tickets, please go to: https://registration.ticketmaster.com/adele', '2023-12-06 21:08:57.050', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347248/392878115_881777303304465_7391470710499102228_n.jpg', 897, 0, 8),
('It’s tha season. 19 Crimes Cali Gold pop a bottle 🥂🍾', '2023-12-12 09:16:22.483', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347384/406270871_905753257577813_5132258533918652184_n.jpg', 783, 0, 9),
('Happy. C. Day @bosslady_ent  Love ya 😘💕🥳🔥👍🏿', '2023-12-12 08:45:40.263', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702347419/395236262_890576072428865_2467724211895534791_n.jpg', 787, 0, 9),
('Handshakes and eyes mean everything to me, as I know they do to this man as well. General Randy George, Chief of Staff of the Army. Pleasure to meet with you, General and thank you for welcoming us to DC to meet with you and your fellow Generals', '2023-12-12 09:37:19.153', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702348640/407810394_917716493046162_7493483611486178957_n.jpg', 785, 0, 10),
('Pentagon bound 🦅 🇺🇸  72 Hours. 4 States.  1,000 handshakes. 0 sleep.  Insane schedule, wouldn’t trade it, grateful for the grind with my hard working team. ', '2023-12-12 09:37:44.057', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702348665/402899879_908399400644538_1274130337635574019_n.jpg', 74, 0, 10),
('We have worked on this film for years and it\s finally in theaters. We hope you love it as much as we loved making it for you. Thank you for continuing to support the Mission: Impossible films.', '2023-12-12 08:45:40.263', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349037/359791413_813642333464826_3120115579489066727_n.jpg', 787, 0, 11),
('I watched it 10x😂😍 hes doing amazing worked all of his movies! I have been fans of him since i was a little girl! I love him very much as his fans my love #TomCruise', '2023-12-12 09:44:21.033', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349062/358590906_813144380181288_4282403554439202327_n.jpg', 454, 0, 11),
('Four cities. Four screenings. We had so much fun at the first fan screenings for Mission: Impossible! Thank you to everyone who came out.', '2023-12-12 08:58:48.843', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349082/359800518_813141150181611_8849542498013411416_n.jpg', 213, 0, 11),
('Can’t ask for better fans🫶🏻 Nice meeting you all in Foshan! #Day4 #Walkerworld #Tour', '2023-12-12 09:53:58.037', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349639/409515081_18407746684049074_511349696850166247_n.jpg', 454, 0, 12),
('Check out the trailer for my Walkerworld Map -Created in Fortnite! Available on December 15h! 🔥 Gameplay Trailer: https://www.youtube.com/watch?v=07Z-DojGMAw', '2023-12-12 09:54:17.967', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349659/408837341_904851064338347_7842987475978414610_n.jpg', 244, 0, 12),
('I feel that 🔥', '2023-12-12 09:54:40.847', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349680/408990774_18407280505049074_3595923196401654023_n.jpg', 554, 0, 12),
('How many Walkers can you count? Biggest show of the tour so far… Xie Xie🫶🏻 #Day3 #Walkerworld #Tour', '2023-12-12 09:55:00.600', 'http://res.cloudinary.com/dzmtmpayb/image/upload/v1702349699/393140996_18406942624049074_5831620415303764175_n.jpg', 44, 0, 12);



INSERT INTO Comment (Content, CommentTime, UserID, PostID) VALUES
('Amazing!!!', '2023-12-11 10:58:06.893', 6, 2),
('Goob Job', '2023-12-11 10:58:22.207', 6, 2),
('Excellent!!', '2023-12-11 10:58:39.027', 6, 3),
('Nice!', '2023-12-12 09:19:14.280', 1, 41),
('Beauty!!!', '2023-12-12 09:19:27.670', 1, 32),
('Thank you, from an Aussie dealing w bi polar type 1, debilitating anxiety & depression, ptsd & insomnia ❤️', '2023-12-12 09:19:54.943', 1, 23),
('I love froot loops', '2023-12-12 09:20:21.230', 1, 16),
('If I Was A Drinker I Would Rush Out And Get A Bottle, But Since I\m Not, Season Greetings To You And Your Family. Happy Holidays.', '2023-12-12 09:20:57.027', 1, 30),
('Great cereal by a Great King 👌👍❤️💙💯😎', '2023-12-12 09:21:47.467', 2, 40),
('They couldn\t have picked a better person to create an amazing rap for an amazing team.🏈💯💯❤️💙😎', '2023-12-12 09:22:14.300', 2, 38),
('Thats love and showing support. 🥰👍💜🧡', '2023-12-12 09:22:36.793', 2, 36),
('I love you Snoop! The best!!!!❤', '2023-12-12 09:23:15.057', 3, 41),
('I heard your nephew is a great ball player. Best of luck to you young man 💙', '2023-12-12 09:23:43.327', 3, 40),
('It’s unbelievable how your songs struck so many cords with people, they helped me get through a horrific break up and helped me find my strength again. Thank you so much for that, your talent cannot be matched. ❤️', '2023-12-12 09:24:10.673', 3, 39),
('She looks amazing, sounds amazing and is amazingly kind . I love her so much she an icon all around the world . 🥰🥰', '2023-12-12 09:24:27.463', 3, 36),
('Always amazing 🤍💫', '2023-12-12 09:24:47.070', 3, 31),
('Absolutely gorgeous!!❤️❤️', '2023-12-12 09:25:20.263', 3, 20),
('Lovely, lady and blessed singer! I could listen to her music everyday! Wishing her many blessings and continued success.', '2023-12-12 09:26:49.027', 3, 18),
('went to the concert last week! An amazing, life changing experience. I would love to go again, however impossible and unrealistic that desire is.I can\t wait for the next concert to be imagined. So much hard work and talent put into this show.', '2023-12-12 09:27:03.293', 3, 17),
('Beautiful pictures! We went twice now for this show and I wish we could go see her again! One of the best nights of my life! 🙂', '2023-12-12 09:27:18.187', 3, 21),
('Wow amazing ♥️♥️♥️', '2023-12-12 09:27:45.770', 3, 22),
('Awesome! Best show ever!', '2023-12-12 09:28:33.490', 6, 41),
('Still so sad I couldn’t get tickets! Seeing her live is a bucket list item!!', '2023-12-12 09:28:45.147', 6, 40),
('Incredible show on Friday Night!!! The best I’ve ever seen in over 100 concerts!!!', '2023-12-12 09:28:55.940', 6, 36),
('After 11 months, it\s finally here', '2023-12-12 09:29:12.747', 6, 37),
('Ahh have a great time! I wish I could be there but feel very blessed to have seen you live twice ❤', '2023-12-12 09:29:34.257', 6, 16),
('We\re crazy for you Adele ❤️', '2023-12-12 09:30:05.230', 6, 38),
('Wow, what a night! Congratulations for your awards… incredible!!! 🤩🤩 xxx', '2023-12-12 09:30:19.993', 6, 39),
('We love you. I had a whole regional tour planned and some festivals lined up that kept getting pushed out, then eventually just canceled. It\s crushing, and sad, but people will understand. The simple fact that you were the one to deliver the message,', '2023-12-12 09:31:00.780', 7, 41),
('THANK YOUUUU! IVE BEEN WAITING FOR THIS. 😭🫶🏻', '2023-12-12 09:31:19.490', 7, 40),
('Taylor Swift please in the future do concerts in all major cities of Australia like you used to do! Please!! Just doing concerts in two cities has made getting tickets to see you like war!! I went to all your other concerts but no matter how hard', '2023-12-12 09:31:39.037', 7, 17),
('we wouldn\t change anything, anything, anything', '2023-12-12 09:31:55.700', 7, 18),
('It\s been 💛💛 years.', '2023-12-12 09:32:31.317', 7, 19),
('Yes, everyone has their own story. But what\s important is that we will always remember things that happened. It\s great!🙂', '2023-12-12 09:32:49.020', 7, 35),
('Hi Taylor Swift I happen to work with a very good human who is a big fan. I know a good human when I meet one (I used to work for Australian Red Cross). Coincidentally Shaun Goodhue is his name (as in Shaun Good (hue man) see what I did there? 😁', '2023-12-12 09:33:06.233', 7, 20),
('Both songs are incredibly beautiful just like the rest of the songs ❤❤', '2023-12-12 09:33:22.270', 7, 21),
('Dwayne,you are so inspirational, Giving,Kind,Gorgeous Smile Gorgeous, Man.Your Totally Amazing.Thank you for being you.', '2023-12-12 09:38:00.850', 10, 41),
('You are a blessing to them all and may God continue to bless you now and forever 🙏❤️❤️ (The Rock of Time)', '2023-12-12 09:38:28.660', 10, 40),
('Insane story wow... thats a tough life his dad had to live through wow ... guys a true warrior fr🙏🏼🙏🏼🙏🏼🙏🏼💯💯💯💯💯', '2023-12-12 09:38:44.310', 10, 39),
('You are a great father, thank you for teaching that it is not only about providing but also about hugging, guiding, living together and above all loving! That is the great and noble work of a father 👏✨💗👌', '2023-12-12 09:38:58.977', 10, 36),
('You are a humble and a kind hearted ❤ person', '2023-12-12 09:39:11.907', 10, 34),
('Dwayne you are a Magnificent Dad, you show that in the way you care about the world around you and what you do for complete strangers!!!! You wear your heart on your sleeve and that\s a fantastic way to live!!!!!!!!!', '2023-12-12 09:39:25.180', 10, 32),
('Trevor is one of my favorites. Trusted with the story!❤️❤️❤️❤️❤️❤️❤️', '2023-12-12 09:39:44.087', 10, 16),
('Thank you for recognizing me as a top diamond ♦️ fan. You’re so incredibly talented And you’re amazing person With a good heart and soul.🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏', '2023-12-12 09:40:06.307', 10, 17),
('Thank you so much D wanta Claus !! Wishing you Your Beautiful “Family Wonderful Christmas “Filled with Love & Happiness ♥️♥️♥️♥️♥️♥️🎼🎶🇺🇸🥂🍾🇦🇺⭐️👋', '2023-12-12 09:40:24.083', 10, 20),
('O wow how awesome would that be 🥳🙌🎄💕💝', '2023-12-12 09:40:48.130', 10, 22),
('That\s ok cool. I bet it will be really exciting 👏🏼👏🏼😘❤️', '2023-12-12 09:41:17.713', 10, 23),
('Very nice offer, too bad it\s too far from us 🇨🇿 Czech Republic Dwayne 🥰💘💓😘', '2023-12-12 09:41:30.737', 10, 37);
