-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 10, 2016 at 02:02 PM
-- Server version: 5.1.54
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `IthacaParks`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE IF NOT EXISTS `Activity` (
  `ActivityID` int(11) NOT NULL,
  `ActivityName` text NOT NULL,
  PRIMARY KEY (`ActivityID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`ActivityID`, `ActivityName`) VALUES
(0, 'Running'),
(1, 'Swimming'),
(2, 'Hiking'),
(3, 'Sledding'),
(4, 'Ice Skating'),
(5, 'Canoeing'),
(6, 'Camping'),
(7, 'Fishing'),
(8, 'Picnic');

-- --------------------------------------------------------

--
-- Table structure for table `Park`
--

CREATE TABLE IF NOT EXISTS `Park` (
  `ParkID` int(11) NOT NULL,
  `ParkName` text NOT NULL,
  `ParkLong` float NOT NULL,
  `ParkLat` float NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`ParkID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Park`
--

INSERT INTO `Park` (`ParkID`, `ParkName`, `ParkLong`, `ParkLat`, `Description`) VALUES
(0, 'Buttermilk Falls', -76.53, 42.4, 'Buttermilk Falls State Park takes its name from the foaming cascade formed by Buttermilk Creek as it flows down the steep valley side toward Cayuga Lake. The upper park has a small lake, hiking trails through woodlands and along the gorge and rim, picnic areas and playing fields. The lower park has a campground, pool and playing fields, beyond which is Larch Meadows. Larch Meadows is a wetland area through which a nature trail winds. Park activities, including tours through Buttermilk gorge, are offered weekly from July 4th through Labor Day.'),
(1, 'Taughannock Falls', -76.606, 42.545, 'Taughannock Falls State Park''s namesake waterfall is one of the outstanding natural attractions of the Northeast. Taughannock Falls plunges 215 feet past rocky cliffs that tower nearly 400 feet above the gorge. Gorge and rim trails offer spectacular views from above the falls and from below at the end of the gorge trail. Campsites and cabins overlook Cayuga Lake, with marina, boat launch and beach nearby. A multi-use trail--hiking, cross-country skiing--winds past sledding slopes and natural skating ponds. Boat Launch Site not suitable for any type of sailboat.'),
(2, 'Treman State Park', -76.574, 42.4, 'Robert H. Treman State Park is an area of wild beauty, with the rugged gorge called Enfield Glen as its scenic highlight. Winding trails follow the gorge past 12 waterfalls, including the 115-foot Lucifer Falls, to where visitors can see a mile-and-a-half down the wooded gorge as it winds its way to the lower park. Campers can choose from tent or RV sites or cabins. Enjoy nine miles of hiking trails, or swim in a stream-fed pool beneath a waterfall. Swimming is allowed in lifeguarded area only.'),
(3, 'Cascadilla Falls', -76.4941, 42.443, 'Cascadilla Falls is a 20ft multiple cascading fall, the first on a popular gorge trail that connects Cornell University to downtown from College Ave. to Court St. Along the way, the creek drops 400ft past nine waterfalls.'),
(4, 'Ithaca Falls', -76.4917, 42.4528, 'Ithaca Falls is a great place to stop and enjoy a picnic lunch or just relax with a good book! With a 150ft cascading fall, watch Fall Creek''s final plunge to Cayuga Lake. Swimming prohibited. Dogs allowed on leash. No fee.'),
(5, 'Stewart Park', -76.5054, 42.4613, 'Stewart Park is a popular place for barbecues, frisbee, tennis, baseball, and softball, as well as fishing and swimming on the lake. The park has a carousel that operates throughout the summer. In addition, there is a playground, with slides, and a fountain, along with sheltered areas for picnics and large gatherings. The park is also equipped with grills dispersed around the grounds.'),
(6, 'Denison Falls', -76.5549, 42.5188, 'Denison Falls at the Cayuga Nature Center is a beautiful 21ft cascading fall in a peaceful wooded gorge. $3 for adults, $2 for seniors and students, and $1 for kids. Swimming is prohibited.'),
(7, 'Businessman''s Lunch Falls', -76.4841, 42.4326, 'Businessman''s Lunch Fallls is a set of four cascading falls - 30ft, 5ft, 15ft, 15f - and is popular lunch spot for downtown office workers. Beauty and history are highlights at Businessman''s Lunch, a.k.a. Wells Falls, where the creek tumbles 65ft in four drops against the backdrop of an old millwork.');

-- --------------------------------------------------------

--
-- Table structure for table `ParkToActivity`
--

CREATE TABLE IF NOT EXISTS `ParkToActivity` (
  `ParkToActivityID` int(11) NOT NULL,
  `ParkID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `ReviewID` int(11) NOT NULL,
  PRIMARY KEY (`ParkToActivityID`),
  UNIQUE KEY `ParkID` (`ParkID`,`ActivityID`,`ReviewID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ParkToActivity`
--

INSERT INTO `ParkToActivity` (`ParkToActivityID`, `ParkID`, `ActivityID`, `ReviewID`) VALUES
(0, 0, 2, 0),
(1, 1, 0, 1),
(2, 1, 1, 2),
(3, 1, 2, 3),
(4, 1, 5, 4),
(5, 1, 7, 5),
(6, 2, 0, 6),
(7, 2, 1, 7),
(8, 2, 4, 8),
(9, 2, 6, 9),
(10, 2, 8, 10),
(11, 3, 2, 11),
(12, 3, 8, 12),
(13, 4, 2, 13),
(14, 4, 8, 14),
(15, 5, 5, 15),
(16, 5, 7, 16),
(17, 6, 2, 17),
(18, 6, 3, 18),
(19, 7, 2, 19),
(20, 7, 8, 20),
(21, 0, 1, 21),
(22, 3, 1, 22),
(23, 0, 0, 23),
(24, 7, 0, 24),
(25, 5, 1, 25),
(26, 5, 8, 26),
(27, 5, 6, 27),
(28, 1, 6, 28);

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE IF NOT EXISTS `Review` (
  `ReviewID` int(11) NOT NULL,
  `Comment` text NOT NULL,
  `Image` text NOT NULL,
  `ParkID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  UNIQUE KEY `ParkID` (`ParkID`,`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`ReviewID`, `Comment`, `Image`, `ParkID`, `UserID`) VALUES
(0, 'This park is awesome', 'image here', 0, 0),
(1, 'Really cool park!', 'image here', 1, 1),
(2, 'Anyone who enjoys swimming should visit this park!', 'image here', 1, 2),
(3, 'A great place to hike!', 'image here', 1, 3),
(4, 'First time canoeing on the lake and it was a blast!', 'image here', 1, 4),
(5, 'Caught a big ol'' bass!!', 'image here', 1, 5),
(6, 'Nice time running through the park.', 'image here', 2, 2),
(7, 'Had a very cool refreshing swim', 'image here', 2, 1),
(8, 'Lots of spectacular trails to go on!', 'image here', 2, 4),
(9, 'Peaceful place to set up your tent.', 'image here', 2, 3),
(10, 'Ate lunch with the kids on the grass near the playground, it was fantastic!', 'image here', 2, 0),
(11, 'Nice trails but not the best', 'image here', 3, 5),
(12, 'Had a wonderful Sunday brunch right near the falls.', 'image here', 3, 4),
(13, 'Cool natural spot to take a hike!', 'image here', 4, 1),
(14, 'Had a fun time skating in the snow', 'image here', 4, 0),
(15, 'The weather was cold but it was a sweet place to hike.', 'image here', 5, 3),
(16, 'Didn''t catch any fish but had a terrific time!', 'image here', 5, 2),
(17, 'Had a nice peaceful hike through the woods', 'image here', 6, 5),
(18, 'Took my son sledding, we had so much fun!!', 'image here', 6, 0),
(19, 'Good hike, not a lot of trails though.', 'image here', 7, 4),
(20, 'Great place to eat lunch with beautiful views of the water and flowers.', 'image here', 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Season`
--

CREATE TABLE IF NOT EXISTS `Season` (
  `SeasonID` int(11) NOT NULL,
  `Season Name` text NOT NULL,
  PRIMARY KEY (`SeasonID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Season`
--

INSERT INTO `Season` (`SeasonID`, `Season Name`) VALUES
(0, 'Spring'),
(1, 'Summer '),
(2, 'Autumn '),
(3, 'Winter');

-- --------------------------------------------------------

--
-- Table structure for table `SeasonToActivity`
--

CREATE TABLE IF NOT EXISTS `SeasonToActivity` (
  `SeasonToActivityID` int(11) NOT NULL,
  `SeasonID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  PRIMARY KEY (`SeasonToActivityID`),
  UNIQUE KEY `SeasonID` (`SeasonID`,`ActivityID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SeasonToActivity`
--

INSERT INTO `SeasonToActivity` (`SeasonToActivityID`, `SeasonID`, `ActivityID`) VALUES
(0, 0, 0),
(1, 0, 1),
(2, 0, 2),
(3, 0, 5),
(4, 0, 6),
(5, 0, 7),
(6, 0, 8),
(7, 1, 0),
(8, 1, 1),
(9, 1, 2),
(10, 1, 5),
(11, 1, 6),
(12, 1, 7),
(13, 1, 8),
(14, 2, 0),
(15, 2, 2),
(16, 2, 5),
(17, 2, 7),
(18, 2, 8),
(19, 3, 3),
(20, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `UserID` int(11) NOT NULL,
  `First Name` text NOT NULL,
  `Last Name` text NOT NULL,
  `Info` text NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `First Name`, `Last Name`, `Info`) VALUES
(0, 'Ally', 'Apple', 'Age 21 \r\n'),
(1, 'Bobby ', 'Banana ', 'Age 21 \r\n'),
(2, 'Carl', 'Cactus', 'Age 20'),
(3, 'Danny ', 'Dolphin', 'Age 23'),
(4, 'Elly', 'Elephant', 'Age 22'),
(5, 'Frank', 'Flowers', 'Age 23');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
