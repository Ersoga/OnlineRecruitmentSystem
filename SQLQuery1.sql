﻿select * from Jobs where CollegesId in (select CollegesId from Colleges where CityId = 2);