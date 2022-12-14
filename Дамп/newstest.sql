-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 24 2022 г., 23:36
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `newstest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `city`) VALUES
(1, 'Москва'),
(2, 'Краснодар'),
(3, 'Уфа');

-- --------------------------------------------------------

--
-- Структура таблицы `city_news`
--

CREATE TABLE `city_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `city_news`
--

INSERT INTO `city_news` (`id`, `news_id`, `cities_id`, `created_at`, `updated_at`) VALUES
(1, 8, 1, NULL, NULL),
(2, 9, 1, NULL, NULL),
(3, 10, 1, NULL, NULL),
(4, 11, 2, NULL, NULL),
(5, 12, 3, NULL, NULL),
(6, 13, 3, NULL, NULL),
(7, 14, 2, NULL, NULL),
(8, 15, 2, NULL, NULL),
(9, 8, 2, NULL, NULL),
(10, 8, 3, NULL, NULL),
(11, 15, 1, NULL, NULL),
(12, 15, 3, NULL, NULL),
(13, 14, 1, NULL, NULL),
(14, 14, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `news_id`) VALUES
(7, 8),
(1, 9),
(17, 10),
(3, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_22_134909_create_news_table', 1),
(7, '2022_08_22_135547_create_favorites_table', 1),
(8, '2022_08_22_134919__create_cities_table', 2),
(9, '2022_08_24_080728_create_news_cities_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  ` annonce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favorites` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, ` annonce`, `description`, `img`, `favorites`, `created_at`, `updated_at`) VALUES
(8, 'Выучиться на фельдшера можно будет после окончания девяти классов', 'Новый ФГОС СПО вступает в силу', 'Теперь получить квалификацию фельдшера можно будет после 9 классов. Минпросвещения России по поручению президента страны актуализировало федеральные государственные образовательные стандарты среднего профобразования (ФГОС СПО) по медицинским специальностям.\n\n\n\nМинпросвещения совместно с Минздравом актуализировали ФГОС СПО по медицинским специальностям. Изменения коснулись сроков обучения и требований к наличию среднего общего образования. Так, например, выпускники девятых классов, поступившие в колледж, теперь смогут освоить квалификацию фельдшера за четыре года в рамках специальности 31.02.01 «Лечебное дело», сообщает пресс-служба Минпросвещения.\n\nВ 2019 году бывший министр здравоохранения Вероника Скворцова указывала, что с 1990-х годов прием абитуриентов в медицинские колледжи сократился в два раза. В 2012 году показатель увеличился на 41%, но отставание все равно составляло 16,5 тыс. выпускников.\n\nСделать доступным для выпускников девятых классов поступление в медицинские ссузы (до сих пор они принимали только выпускников одиннадцатых классов) призывала в 2021 году сопредседатель регионального штаба ОНФ в Свердловской области, директор Свердловского областного медицинского колледжа Ирина Левина, информировал Общероссийский народный фронт. Теперь это пожелание станет реальностью.\n\nВсего утверждено десять ФГОС СПО по следующим медицинским специальностям: 31.02.01 «Лечебное дело», 31.02.02 «Акушерское дело», 31.02.03 «Лабораторная диагностика», 31.02.04 «Медицинская оптика», 31.02.05 «Стоматология ортопедическая», 31.02.06 «Стоматология профилактическая», 32.02.01 «Медико-профилактическое дело», 33.02.01 «Фармация», 34.02.01 «Сестринское дело», 34.02.02 «Медицинский массаж (для обучения лиц с ограниченными возможностями здоровья по зрению)».\n\nВо всех образовательных программах предусмотрено изучение медицинских информационных систем, а некоторые ФГОС дополнены новыми общепрофессиональными дисциплинами (так, специальность 31.02.03 «Лабораторная диагностика» даст возможность освоить дисциплину «Генетика человека с основами медицинской генетики»).', 'img/SfasfEsfgwefFEr23542rDf.jpg', 1, '2022-08-18 14:20:32', NULL),
(9, 'Число травм позвоночника у детей выросло из-за селфи и электросамокатов', 'НМИЦ ортопедии зафиксировал рост доли сложных переломов с 23 до 32% от общего числа', 'НМИЦ детской травматологии и ортопедии им. Турнера зафиксировал рост числа пациентов со сложными переломами позвоночника за последние десять лет. Это связано в том числе с популярностью электросамокатов и привычкой фотографироваться на небезопасных площадках, считает директор Центра.\n\nДоля сложных переломов позвоночника у пациентов НМИЦ детской травматологии и ортопедии им. Турнера выросла с 23 до 32% от общего числа в период с 2010 по 2020 годы, сообщил директор института Сергей Виссарионов в рамках пресс-конференции ТАСС 22 августа.\n\nЕжегодно медицинский центр принимает около 200 детей с повреждениями позвоночника и опорно-двигательного аппарата.\n\n«В 2010 году основную массу (около 77%) составляли нестабильные повреждения позвоночника и только 23% приходилось на переломы позвоночника с повреждениями спинного мозга. В 2020 году количество сложных переломов достигло 32,4%. Это очень значительный рост подобной травмы. Травмы связаны с ДТП, падением детей с этажей при сидении на подоконниках, падении с деревьев. Еще одной особенностью детского травматизма стало выполнение «селфи» с различных высоких построек и использование современных средств передвижения: мопедов, мотоциклов, электросамокатов», — рассказал Виссарионов.\n\nВ 2021 году в России по разным причинам погибло около 6 тыс. детей, привел данные ректор Санкт-Петербургского государственного педиатрического медицинского университета Дмитрий Иванов. Он отметил, что детская смертность в стране снижается: так, в прошлом году система российского здравоохранения спасла на 14 тыс. детей больше, чем десять лет назад. \nЕжегодно медицинский центр принимает около 200 детей с повреждениями позвоночника и опорно-двигательного аппарата.\n\n«В 2010 году основную массу (около 77%) составляли нестабильные повреждения позвоночника и только 23% приходилось на переломы позвоночника с повреждениями спинного мозга. В 2020 году количество сложных переломов достигло 32,4%. Это очень значительный рост подобной травмы. Травмы связаны с ДТП, падением детей с этажей при сидении на подоконниках, падении с деревьев. Еще одной особенностью детского травматизма стало выполнение «селфи» с различных высоких построек и использование современных средств передвижения: мопедов, мотоциклов, электросамокатов», — рассказал Виссарионов.\n\nВ 2021 году в России по разным причинам погибло около 6 тыс. детей, привел данные ректор Санкт-Петербургского государственного педиатрического медицинского университета Дмитрий Иванов. Он отметил, что детская смертность в стране снижается: так, в прошлом году система российского здравоохранения спасла на 14 тыс. детей больше, чем десять лет назад. ', 'img/sSdfwq23Sfd32ffqRsaFEE.jpg', NULL, '2022-08-18 15:20:32', NULL),
(10, 'Минздрав подготовил новые правила аккредитации специалистов', 'В проекте учли пожелания профессиональных НКО', 'Минздрав обновит порядок и условия проведения аккредитации медицинских и фармацевтических специалистов. В новом положении значительно упрощены механизмы подачи документов для прохождения всех типов аккредитаций, в том числе благодаря широкому внедрению цифровых технологий.\n\nМинздрав разработал и 16 августа направил на согласование в Национальную медицинскую палату (НМП) проект нового положения об аккредитации специалистов (копия есть в распоряжении «Медицинского вестника»). В пояснительной записке президенту НМП Леониду Рошалю уточняется, что в нем «учтены предложения представителей профессиональных некоммерческих организаций, образовательных организаций и практикующих специалистов».\n\nВажной новеллой является детализация и нормативное закрепление механизма допуска к осуществлению профессиональной деятельности специалистов, получивших медицинское, фармацевтическое или иное образование в иностранных организациях, осуществляющих образовательную деятельность.\n\n«Кроме того, в новом положении значительно упрощены механизмы подачи документов для прохождения всех типов аккредитации, в том числе благодаря широкому внедрению цифровых технологий. Данные меры повысят комфортность прохождения аккредитации, а также снизят нагрузку на секретарей аккредитационных комиссий, подкомиссий и федеральные аккредитационные центры», — уточняется в письме.\n\nВ проекте появилось дополнение, что аккредитация специалиста проводится с учетом квалификационных требований к медицинским и фармацевтическим работникам, утверждаемых Минздравом.\n\nСоставы аккредитационных комиссий и центральной аккредитационной комиссии (ЦАК) утверждаются сроком на три года приказом Минздрава (ранее — на один год). Основной формой деятельности аккредитационных комиссий и аккредитационных подкомиссий являются заседания, проводимые в очной форме. Ранее допускался дистанционный формат. Такой формат допускается для заседаний центральных аккредитационных комиссий (ЦАК).\n\nОбозначен срок, в течение которого хранятся протоколы заседаний аккредитационных комиссий и подкомиссий, которые направляются в Федеральные аккредитационные центры, — шесть лет (ранее срок не уточнялся). Сроки приема и регистрации документов, необходимых для допуска к прохождению первичной аккредитации и первичной специализированной аккредитации, составляют не менее трех рабочих дней (ранее — не менее 14 дней).\n\nСейчас процедуру аккредитации регулирует ведомственный приказ № 1081н от 22.11.2022. Срок его действия истекает 1 марта 2023 года. В проекте обновленного положения уточняется, что он вступит в силу с 1 января 2023 года и будет действовать до 1 января 2029 года.\n\nВ конце мая министерство разослало в регионы письмо с просьбой информировать специалистов о приоритетном способе подачи документов для аккредитации — с использованием федерального регистра медицинских работников (ФРМР). Ставилась цель ускорить процесс. Отмечалось, что в документах, направленных по почте или лично, было больше ошибок, чем при использовании ФРМР.\n\nС начала введения механизма первичной специализированной и периодической аккредитации ее прошли больше 800 тыс. медицинских и фармацевтических работников с высшим и средним образованием. Из них в течение последних двух месяцев — почти 170 тыс., сообщал ранее «МВ». К 2024 году допуск к профессиональной деятельности через аккредитацию должны получить 2,1 млн медработников (нарастающим итогом).\n\nВ 2021 году первичная, первичная специализированная и периодическая аккредитации проводились по 136 специальностям на 419 площадках в 84 регионах. По данным Минздрава, с экзаменами не справились 8,7% специалистов. Самый высокий процент неудач зафиксирован среди проходивших профессиональную переподготовку — 12,4%.', 'img/WqfdqwR1rSFasSfCcweg.jpg', 1, '2022-08-18 16:20:32', NULL),
(11, 'Правительство утвердило план мероприятий по комплексной реабилитации инвалидов', 'До 2025 года запланировано более 40 различных мероприятий', 'В России утвердили план мероприятий по комплексной реабилитации и абилитации инвалидов до 2025 года. За это время запланировано более 40 различных мероприятий.\n\n\nПравительство утвердило план мероприятий по комплексной реабилитации и абилитации инвалидов до 2025 года. Соответствующее Распоряжение № 2253 от 16.08.2022 подписано, сообщается на сайте правительства. В ближайшие два с половиной года запланировано более 40 различных мероприятий.\n\nВ частности, во II квартале 2023 года правительство подготовит и внесет в Госдуму поправки в несколько законов. Изменения коснутся стандартов реабилитационных услуг, что в конечном итоге должно повысить эффективность самой реабилитации. Также для региональных и муниципальных реабилитационных центров разработают и утвердят типовые организационно-функциональные модели. В регионах создадут пункты проката тренажеров, с помощью которых можно будет заниматься спортом.\n\nКроме того, для логопедов, дефектологов, педагогов-психологов и других специалистов по комплексной реабилитации и абилитации разработают программы повышения квалификации. В вузах с учебно-методическими центрами, где обучаются студенты-инвалиды, к концу 2024 года запустят пилот реабилитации учащихся с ограниченными возможностями здоровья.\n\nСогласно плану будет внедрена практика предоставления услуг по дневному пребыванию ментальных инвалидов в организациях социального обслуживания. Также предполагается развивать дистанционные технологии в системе комплексной реабилитации и абилитации инвалидов.\n\nТакже план посвящен вопросам комплексной реабилитации детей-инвалидов, в том числе своевременной диагностике еще на стадии внутриутробного развития. Будет расширена практика проведения перинатальных и неонатальных скринингов, чтобы повысить шансы малышей справиться с недугом на ранней стадии и избежать его последствий в будущем.\n\nВ результате реализации плана не менее 95% людей с инвалидностью будут охвачены услугами по основным направлениям комплексной реабилитации и абилитации к 2025 году, подчеркнули в правительстве.\n\nВ апреле правительство утвердило новый порядок назначения и подтверждения инвалидности. Так, граждане могут теперь самостоятельно выбирать формат прохождения медико-социальной экспертизы — очный или заочный. Правила будут вводиться в три этапа и объединят действующие и новые положения, писал «МВ».\n\nВ том же месяце Минтруд предложил в обязательном порядке подключить все российские банки к системе электронного сертификата для инвалидов. Пока ее поддерживают пять кредитных организаций, сообщил замминистра труда и социальной защиты Алексей Вовченко. Обязательный порядок, по его словам, поможет ускорить процесс интеграции банков в систему.', 'img/He2r2WqwSDFQAEr3Fq.jpg', 1, '2022-08-18 17:20:32', NULL),
(12, 'ADA назвала сердечную недостаточность самым недооцененным осложнением диабета', 'Риск развития заболевания повышен у всех пациентов с диабетом 1-го и 2-го типов', 'Американская диабетическая ассоциация (ADA) опубликовала консенсус по сердечной недостаточности при сахарном диабете. Заболевание может развиваться даже при отсутствии гипертензии, ишемической болезни сердца или заболеваний сердечных клапанов. Раннее выявление и терапия сердечной недостаточности снижает риск неблагоприятных исходов заболевания.\n\n\nСердечная недостаточность — самое недооцененное осложнение сахарного диабета, заявили эксперты ADA. Консенсусный доклад опубликован в журнале Diabetes Care.\n\nСогласно документу, сердечная недостаточность встречается у 22% пациентов с диабетом, причем заболевание может развиваться даже при отсутствии гипертензии, ишемической болезни сердца или заболеваний сердечных клапанов и служить единственным сердечно-сосудистым осложнением у этой группы пациентов. За последнее десятилетие заболеваемость диабетом (в особенности диабетом 2-го типа) выросла в мире на 30%, причем ожидается и дальнейший рост, а значит частота появления сердечной недостаточности также возрастет.\n\nФакторами риска развития сердечной недостаточности среди пациентов с диабетом 1-го и 2-го типов эксперты назвали продолжительность заболевания, плохой гликемический контроль, неконтролируемую гипертензию, гиперлипидемию, высокий индекс массы тела, микроальбуминурию, нарушение функции почек, ишемическую болезнь сердца и заболевание периферических артерий.\n\nРаннее выявление сердечной недостаточности позволит назначить своевременную терапию и предотвратить нежелательные исходы, указано в заявлении. Риск развития сердечной недостаточности повышен у всех пациентов с сахарным диабетом как 1-го, так и 2-го типа. Эксперты рекомендуют хотя бы раз в год определять уровень натрийуретического пептида и высокочувствительного сердечного тропонина для выявления пациентов с бессимптомной сердечной недостаточностью.\n\nВажной частью терапии авторы документа называют изменение образа жизни, включая регулярные физические нагрузки, снижение веса, отказ от курения и употребления алкоголя. Бессимптомным пациентам с диабетом 1-го и 2-го типов и гипертензией показано использование ингибиторов АПФ и блокаторов рецепторов ангиотензина 2-го типа. Применение тиазидных диуретиков и ингибиторов АПФ эффективнее предотвращает появление симптомов сердечной недостаточности, чем прием блокаторов кальциевых каналов, отмечают эксперты. Бессимптомным пациентам с диабетом и хроническим заболеванием почек рекомендовано назначение финеренона. Авторы документа подчеркивают, что на фоне терапии финереноном и другими антагонистами минералкортикоидных рецепторов необходимо контролировать уровень калия.\n\nТерапия при симптоматической сердечной недостаточности со сниженной фракцией выброса среди пациентов с диабетом не отличается от лечения людей без диабета. Возможно использование комбинации блокаторов ангиотензиновых рецепторов и ингибиторов неприлизина, ингибиторов АПФ или блокаторов рецепторов ангиотензина 2-го типа, бета-блокаторов, антагонистов минералкортикоидных рецепторов и ингибиторов SGLT2. Однако первой линией терапии для пациентов с диабетом и сердечной недостаточностью со сниженной фракцией выброса служит комбинация сакубитрила с валсартаном.\n\nПациентам с диабетом и сердечной недостаточностью с сохраненной фракцией выброса рекомендуется использовать спиронолактон или сочетание сакубитрила с валсартаном. Кроме того, всем пациентам с диабетом и симптоматической сердечной недостаточностью или высоким риском сердечно-сосудистых заболеваний показано назначение ингибиторов SGLT2 для снижения риска госпитализации.', 'img/WWsafasfW232423Ssffg.jpg', NULL, '2022-08-19 18:20:32', NULL),
(13, 'AHA опубликовала заявление о значимости симптомов сердечно-сосудистых заболеваний', 'Симптомы некоторых заболеваний зависели от пола', 'Американская ассоциация по проблемам сердца (AHA) опубликовала научное заявление о значимости симптомов сердечно-сосудистых заболеваний и их исследований. Проявления многих заболеваний зависят от пола, а некоторые симптомы характерны сразу для нескольких патологий. Депрессия и когнитивные нарушения могут препятствовать выявлению симптомов заболеваний.\n\n\nAHA опубликовала научное заявление по самым значимым симптомам сердечно-сосудистых заболеваний. Полный текст документа опубликован в журнале Circulation.\n\nАвторы кратко описывают наиболее характерные проявления шести сердечно-сосудистых патологий (острого коронарного синдрома, сердечной недостаточности, заболеваний клапанов сердца, инсульта, нарушений ритма и заболевания периферических сосудов), отмечая сходство и различия симптомов, в том числе в зависимости от пола пациентов.\n\nТак, для острого коронарного синдрома наиболее характерна боль в груди, которая может иррадиировать в челюсть, плечо, руку или верхнюю часть спины, сказано в заявлении. Сопутствующие симптомы включают удушье, потливость, необычную усталость, тошноту и головокружение. У женщин дополнительные симптомы встречаются чаще, чем у мужчин.\n\nНаиболее характерными проявлениями сердечной недостаточности служат одышка, дискомфорт при дыхании и нехватка воздуха. При этом неявные симптомы, которые могут остаться незамеченными, часто служат предвестниками ухудшения течения заболевания. К ним относятся диспепсия, тошнота и рвота, потеря аппетита, слабость, непереносимость физической нагрузки, бессонница, боль, расстройства настроения и нарушение когнитивной функции. У женщин разнообразие проявлений больше, чаще встречается депрессия и тревожность, которые ухудшают качество жизни, отмечают эксперты.\n\nЗаболевания клапанов сердца служат наиболее распространенной причиной развития сердечной недостаточности, поэтому их симптомы практически неотличимы от других проявлений заболевания. При отсутствии тяжелой дисфункции для заболеваний клапанов характерен длительный бессимптомный период, который сменяется прогрессированием. Симптомы аортального стеноза зависят от пола пациента. У женщин чаще встречается одышка и непереносимость физической нагрузки. Для мужчин больше характерна боль в груди.\n\nПри инсульте у женщин помимо традиционных проявлений чаще встречается неочаговая симптоматика (головная боль, изменение психической активности, кома или ступор). Эксперты подчеркивают, что обследование пациентов, которые перенесли инсульт, должно включать оценку тревожности, депрессии, усталости и боли.\n\nБольшинство нарушений ритма сердца проявляется пальпитацией. Кроме того, пациентов может беспокоить усталость и одышка. Реже встречаются боль в груди, головокружение, предобморочное состояние и усталость. У женщин заболевание чаще проявляется пальпитацией, у мужчин и людей пожилого возраста — протекает бессимптомно.\n\nКлассическая перемежающаяся хромота встречается примерно у трети пациентов с заболеванием периферических артерий, сказано в заявлении. У женщин чаще встречаются неклассические симптомы или бессимптомное течение заболевания. Кроме того, для женщин и пациентов старшего возраста характерно развитие депрессии.\n\nЭксперты отмечают, что некоторые симптомы сердечно-сосудистых заболеваний часто остаются нераспознанными, поскольку пациенты считают, что эти проявления не относятся к данному заболеванию, например, усталость, нарушения сна, набор веса и депрессия.\n\nДепрессия в два раза чаще встречается у пациентов с сердечно-сосудистыми заболеваниями, чем в общей популяции, сказано в документе. Облегчение симптомов является важной частью ведения пациентов с сердечно-сосудистыми заболеваниями, при этом появление депрессии и когнитивных нарушений зачастую препятствует их выявлению. Необходимо разработать методики оценки и наблюдения за симптомами сердечно-сосудистых заболеваний, которые будут учитывать наличие депрессии и когнитивных нарушений, подчеркивают эксперты.\n\n', 'img/dfdsfEDFWEgfsfg$52452.jpg', NULL, '2022-08-19 18:20:32', NULL),
(14, 'Intel показала процессоры Alder Lake-PS для интернета вещей и встраиваемых решений', 'Intel представила серию процессоров Alder Lake-PS. В неё вошли пять моделей Alder Lake-HL, имеющие от восьми до 14 ядер с поддержкой от 12 до 20 потоков и заявленным показателем TDP от 35 до 60 Вт. Также компания показала шесть моделей Alder Lake-UL с количеством ядер от пяти до десяти, которые поддерживают от шести до 12 потоков и имеют уровень TDP от 12 до 28 Вт', 'Intel представила серию процессоров Alder Lake-PS. В неё вошли пять моделей Alder Lake-HL, имеющие от восьми до 14 ядер с поддержкой от 12 до 20 потоков и заявленным показателем TDP от 35 до 60 Вт. Также компания показала шесть моделей Alder Lake-UL с количеством ядер от пяти до десяти, которые поддерживают от шести до 12 потоков и имеют уровень TDP от 12 до 28 Вт. Часть новинок поддерживает Intel vPro Enterprise.\n\nВсе новые процессоры используют гибридную архитектуру из высокопроизводительных и энергоэффективных ядер. Чипы будут применять в качестве основы устройств интернета вещей, видео-киосков, цифровых вывесок и иных бизнес-решений. Фактически они дополняют серию процессоров Alder Lake-S, которую показали в начале 2022 года.\n\nЧипы поддерживают оперативную память стандартов DDR5-4800 и DDR4-3200, предлагают поддержку до восьми каналов PCIe 4.0 (2×4), до четырёх интерфейсов Thunderbolt 4.0 и поддержку до четырёх дисплеев формата 4K с частотой до 60 Гц в режиме HDR или одного дисплея 8K с HDR и поддержкой 12-битного цвета.\n\nМодели Alder Lake-HL получили от четырёх до шести высокопроизводительных ядер, а также от четырёх до восьми энергоэффективных. Процессоры работают в диапазоне частот от 2,0 до 4,8 ГГц, имеют от 12 до 24 Мбайт кеш-памяти L3, оснащены встроенной графикой Intel Iris Xe и Intel UHD Graphics, в составе которой присутствуют до 96 исполнительных блоков, работающих с частотой от 1,2 до 1,4 ГГц.\n\nAlder Lake-UL предлагают до двух высокопроизводительных ядер и от четырёх до восьми энергоэффективных. Они оперируют в диапазоне частот от 2,5 до 4,8 ГГц и получили от 8 до 12 Мбайт кеш-памяти L3. Исключение — самая младшая модель Celeron 7305L с фиксированной частотой 1 ГГц. Процессоры Alder Lake-UL имеют от 48 до 96 исполнительных блоков встроенной графики Iris Xe и Intel UHD Graphics с частотой от 1,1 до 1,25 ГГц.', 'img/dec41aac2e4de0e14feba3de30b772d1.png', NULL, NULL, NULL),
(15, 'Intel предупредила, что на графических процессорах Arc может снизиться производительность старых игр', '5 августа 2022 года разработчики из Intel предупредили, что на графических процессорах Arc может снизиться производительность старых игр на API DirectX 9 и DirectX 11 по сравнению с видеокартами Nvidia и AMD.', '5 августа 2022 года разработчики из Intel предупредили, что на графических процессорах Arc может снизиться производительность старых игр на API DirectX 9 и DirectX 11 по сравнению с видеокартами Nvidia и AMD.\n\nКомпания в курсе проблемы. Причина такой ситуации, по мнению разработчиков Intel, в плохой оптимизации старых игр под новые чипы Intel, так как их «устаревшие API» изначально были разработаны с учётом аппаратного обеспечения графических процессоров от Nvidia и AMD.\n\nРазработчики из Intel Graphics пояснили, что некоторые игры на DirectX 11 на чипах Arc работают хорошо, а вот часть игр пока может подтормаживать. Это происходит из-за особенности механизма управления памятью в работе драйверов карт Intel. Компания продолжает оптимизировать и дорабатывать видеодрайвера для решения этой проблемы.\n\n«Карты Intel Arc работают совсем не так, как Nvidia. Поэтому теперь нам нужно начать более тщательно начать работать с DX11, чтобы производительность наших адаптеров соответствовала ожиданиям от старых игр», — пояснил представитель Intel.\n\nПредставитель Intel Graphics рассказал, что карты Arc сейчас наиболее оптимизированы для игр на API DirectX 12 и Vulcan. Ранее эксперты Linus Tech Tips выяснили, что игра Shadow of the Tomb Raider на Intel Arc A770 показывает производительность 80 FPS при использовании DirectX 12 и всего 40 FPS на DirectX 11.В конце июля пользователи выяснили, что видеокарта Intel Arc A380 не поддерживают ПО для майнинга Ethereum.\n\nIntel Arc A380 уже доступна на китайском рынке, видеоадаптер стоит от $192. Он основан на графическом процессоре ACM-G11 начального уровня с 8 ядрами Xe, работающими на частоте 2450 МГц. Видеокарта получила 6 ГБ памяти GDDR6 и четыре внешних разъёма: три DisplayPort и один HDMI 2.0.', 'img/6jx6vjufew7amo0jgntvudiz2q4.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `city_news`
--
ALTER TABLE `city_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_cities_news_id_foreign` (`news_id`),
  ADD KEY `news_cities_cities_id_foreign` (`cities_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_id` (`news_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `city_news`
--
ALTER TABLE `city_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `city_news`
--
ALTER TABLE `city_news`
  ADD CONSTRAINT `news_cities_cities_id_foreign` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `news_cities_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
